module Jumble
  module REST
    class Connection
      attr_reader   :client
      attr_accessor :reset_at

      def initialize(payload)
        @reset_at = Time.now
        @client   = Twitter::REST::Client.new(payload)
      end

      def <=>(other)
        reset_at <=> other.reset_at
      end

      def alive?
        reset_at < Time.now
      end

      def reset(reset_at)
        self.reset_at = reset_at
      end

    end
  end
end
