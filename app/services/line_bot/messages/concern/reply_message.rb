module LineBot
  module Messages
    module Concern
      module ReplyMessage
        def register_article_success
          {
            "type": "text",
            "text": '記事を登録しました'
          }
        end
        
        def save_line_user_id_success
          {
            "type": "text",
            "text": '連携を完了しました'
          }
        end
        
        private
          def save_line_user_id_failed
            {
              "type": "text",
              "text": '連携に失敗しました'
            }
          end
      end
    end
  end
end