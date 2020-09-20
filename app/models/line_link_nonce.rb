# frozen_string_literal: true

class LineLinkNonce < ApplicationRecord
  belongs_to :user

  def self.generate_link_url(_link_user_id)
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
          "uri": "https://345a12d8a786.ngrok.io /linebots/line_link_login?linkToken=#{line_link_token['linkToken']}"
        }]
      }
    }
  end
end
