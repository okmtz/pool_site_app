class LineLinkNonce < ApplicationRecord
  belongs_to :user, dependent: :destroy

  def self.generate_link_url(link_user_id)
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
              "uri": "https://9082c23ace3b.ngrok.io/linebots/line_link_login?linkToken=#{line_link_token['linkToken']}"
          }]
      }
    }
  end
end
