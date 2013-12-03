require 'twitter'

module Jumble
  module REST
    class Client < BasicObject

      private

      def client
        pool
      end

      def clients
        # FIXME Actually we should load YAML config file here
        @clients ||= [
          ::Twitter::REST::Client.new(access_token: '2195906713-yRGO0d8kK8I51auxX9y9p3Ccocr15o2krQFQ1bq', access_token_secret: 'YNQbdzFgwuatp7gShfjOp2AgCTZPDwjbb2juxu0GNpFUT', consumer_key: 'DJja78hrQZ3nBTGCLG1Q', consumer_secret: 'Xazm7Efo7o0d74XdDPktVfVv1Df2FKqwGgUpj3GAbg'),
          ::Twitter::REST::Client.new(access_token: '2195906713-wR1KdJWz5bdXhXZV2qbFehtCKrlk8Em7Jry6WlR', access_token_secret: '5xIKZcNJOGoP6PHMoP2Gprf3wFfQic6BBqcfIdzX9sW4G', consumer_key: '3XRJ2PcIiXOWAmW0wPVw', consumer_secret: 'rNrgKodbvtpIrul3uFsPpAtzcyDmBqga1xf0xbjDE')
        ]
      end

      def pool

        # @pool ||= [
        #   { client: ..., x_rate_limit_reset: ...}
        # ]
      end

      def method_missing(*args, &block)
        client.send(*args, &block)
      rescue ::Twitter::Error::TooManyRequests => e
        puts e.rate_limit.inspect
        # хранить x-rate-limit-reset
        # прекратить делать retry только в случае, когда все
        # аккаунты истекли (везде 0) и еще не обновились (x-rate-limit-reset больше чем Time.now)

        # В остальном, в rescue записывать x-rate-limit-reset и по нему определять
        # аккаунты, которые быстрее всего обновятся

        # если исключение УЖЕ сработало, значит у нас однозначно осталось 0 попыток
      end

    end
  end
end
