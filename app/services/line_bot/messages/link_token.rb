# frozen_string_literal: true

module LineBot
  module Messages
    class LinkToken
      def self.fetch_link_token(line_user_id)
        client = LineBot::Messages::FetchLineClient.client
        line_link_token = JSON.load(client.create_link_token(line_user_id).body)

        {
          "type": 'template',
          "altText": 'Account Link',
          "template": {
            "type": 'buttons',
            "text": 'Account Link',
            "actions": [{
              "type": 'uri',
              "label": 'Account Link',
              "uri": "#{ENV['WEBHOOK_URL']}/linebots/line_link_login?linkToken=#{line_link_token['linkToken']}"
            }]
          }
        }
      end
    end
  end
end
