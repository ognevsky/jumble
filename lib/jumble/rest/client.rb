require 'twitter'

module Jumble
  module REST
    class Client < BasicObject

      private

      def client
        # FIXME We should implement something more complex
        # than stupid clients mixing
        clients.sample
      end

      def clients
        # FIXME Actually we should load YAML config file here
        @clients ||= [
          ::Twitter::REST::Client.new,
          ::Twitter::REST::Client.new
        ]
      end

      def method_missing(name, *args, &block)
        client.send(name, *args, &block)
      rescue ::Twitter::Error::TooManyRequests
        # FIXME We should not use these infinite retries
        retry
      end

    end
  end
end
