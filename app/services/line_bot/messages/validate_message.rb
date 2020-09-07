# frozen_string_literal: true

module LineBot
  module Messages
    class ValidateMessage
      def self.check_message_format(text)
        return false unless text.start_with?('https://')

        true
      end
    end
  end
end
