module LineBot
  module Messages
    class LinkAccount
      extend LineBot::Messages::Concern::ReplyMessage

      def self.save_line_user_id(event)
        return head :bad_request if event['link']['result'] == 'failed'
        saved_message =  User.save_line_user_id(event['link']['nonce'], event['source']['userId']) ? save_line_user_id_success : save_line_user_id_failed
        saved_message
      end
    end
  end
end