require 'twitter'

module Jumble
  module REST
    class Client < BasicObject

      private

      def connection
        @connection ||= connections.sample
      end

      def connections
        @connections ||= config.map { |payload| Connection.new(payload) }
      end

      def config
        @config ||= begin
          file = ::File.open(::Rails.root.join('config', 'jumble.yml'))
          ::YAML.load(file)
        end
      end

      def method_missing(*args, &block)
        connection.client.send(*args, &block)
      rescue ::Twitter::Error::TooManyRequests => e
        connection.reset(e.rate_limit.reset_at)

        if connections.any?(&:alive?)
          @connection = next_connection
          retry
        else
          raise TooManyRequests.new(next_connection.reset_at)
        end
      end

      def next_connection
        connections.sort.first
      end

    end
  end
end
