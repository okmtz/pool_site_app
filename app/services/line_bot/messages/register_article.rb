# frozen_string_literal: true

module LineBot
  module Messages
    class RegisterArticle
      extend LineBot::Messages::Concern::ReplyMessage

      def self.register(line_user_id, url)
        user_id = UserLineId.find_by(line_user_id: line_user_id).user_id
        Article.create_with_url_content({
                                          user_id: user_id,
                                          url: url
                                        })
      end
    end
  end
end
