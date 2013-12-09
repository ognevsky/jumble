module Jumble
  module REST
    class TooManyRequests < StandardError
      attr_reader :reset_at

      def initialize(reset_at = nil)
        @reset_at = reset_at
      end

    end
  end
end
