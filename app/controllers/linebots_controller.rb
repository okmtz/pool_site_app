class LinebotsController < ApplicationController
  # frozen_string_literal: true
  protect_from_forgery :except => [:create, :line_link_login]
  before_action :validate_signature, only: [:create]

  def create
    client.parse_events_from(body).each do |event|
      line_user_id = event['source']['userId']
      reply(event, line_user_id)
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
    @client ||= LineBot::Messages::FetchLineClient.client
  end

  def reply(event, line_user_id)
    return head :bad_request unless (event['type'] == 'message') || (event['type'] == 'accountLink')

    case event['type']
    when 'message'
      if User.find_by(line_user_id: line_user_id)
        client.reply_message(event['replyToken'], message(event, line_user_id))
      else
        link_url = LineBot::Messages::LinkToken.fetch_link_token(line_user_id)
        client.reply_message(event['replyToken'], link_url)
      end
    when 'accountLink'
      message = LineBot::Messages::LinkAccount.save_line_user_id(event)
      client.push_message("#{line_user_id}", message)
    end
  end

  def validate_signature
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    head :bad_request unless client.validate_signature(body, signature)
  end

  def message(event, line_user_id)
    case event['message']['type']
    when 'text'
      if LineBot::Messages::ValidateMessage.check_message_format(event['message']['text'])
        LineBot::Messages::RegisterArticle.register(line_user_id, event['message']['text'])
        LineBot::Messages::RegisterArticle.register_article_success
      else
        LineBot::Messages::RegisterArticle.register_article_failed
      end
    end
  end
end
