class LinebotsController < ApplicationController
  # frozen_string_literal: true
  protect_from_forgery :except => [:create, :link, :line_link_login]
  before_action :validate_signature, only: [:create]

  def create
    client.parse_events_from(body).each do |event|
      line_user_id = event['source']['userId']

      if event['type'] == 'message'
        if User.find_by(line_user_id: line_user_id)
          client.reply_message(event['replyToken'], message(event, line_user_id))
        else
          client.reply_message(event['replyToken'], generate_link_url(line_user_id))
        end
      elsif event['type'] == 'accountLink'
        return head :bad_request if event['link']['result'] == 'failed'
        nonce = event['link']['nonce']
        line_user_id = event['source']['userId']
        link_user = LineLinkNonce.find_by(nonce: nonce).user
        link_user.line_user_id = line_user_id
        link_user.save
        client.push_message("#{link_user.line_user_id}", success_message)
      else
        head :bad_request
      end
    end
    head :ok
  end

  def line_link_login
    @line_link_token = params['linkToken']
    redirect_to new_user_session_path(line_link_token: @line_link_token)
  end

  private

  def body
    @body ||= request.body.read
  end

  def client
    @client ||= Line::Bot::Client.new do |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    end
  end

  def success_message
    {
      "type": "text",
      "text": '連携を完了しました'
    }
  end

  def generate_link_url(line_user_id)
    line_link_token = JSON.load(client.create_link_token(line_user_id).body)

    {
      "type": "template",
      "altText": "Account Link",
      "template": {
          "type": "buttons",
          "text": "Account Link",
          "actions": [{
              "type": "uri",
              "label": "Account Link",
              "uri": "https://5e33b1e79d99.ngrok.io/linebots/line_link_login?linkToken=#{line_link_token['linkToken']}"
          }]
      }
    }
  end

  def validate_signature
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    head :bad_request unless client.validate_signature(body, signature)
  end

  def events
    @events ||= client.parse_events_from(body)
  end

  def message(event, line_user_id)
    case event
    when Line::Bot::Event::Postback
      LineBot::PostbackEvent.send(event['postback']['data'])
    when Line::Bot::Event::Message
      case event['message']['type']
      when 'text'
        if event['message']['text'].start_with?("https://")
          user_id = User.find_by(line_user_id: line_user_id).id
          url = event['message']['text']
          Article.create_with_url_content({user_id: user_id, url: url})
          {
            "type": "text",
            "text": '記事を登録しました'
          }
        else
          {
            "type": "text",
            "text": 'urlを送ってください'
          }
        end
      end
    end
  end
end
