module LineBot
  module Messages
    class LinkAccount
      extend LineBot::Messages::Concern::ReplyMessage

      def self.save_line_user_id(event)
        return head :bad_request if event['link']['result'] == 'failed'
        line_id_save_flg = User.save_line_user_id(event['link']['nonce'], event['source']['userId'])

        if line_id_save_flg
          nonce = LineLinkNonce.find_by(nonce:event['link']['nonce'])
          nonce.destroy
        end
        
        saved_message =  line_id_save_flg ? save_line_user_id_success : save_line_user_id_failed
        saved_message
      end
    end
  end
end