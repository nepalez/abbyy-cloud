class ABBYY::Cloud
  module Operations
    class Prices < Base
      # rubocop: disable Metrics/LineLength
      link "https://api.abbyy.cloud/swagger/ui/index#!/Prices/Prices_GetAccountPrices"
      # rubocop: enable Metrics/LineLength
      path "v0/prices/details"
      http_method "get"

      request_query do
        attribute :skip, Types::Strict::Int
        attribute :take, Types::Strict::Int
        attribute :type, Types::Strict::String.optional
        attribute :from, Types::Locale.optional
        attribute :to,   Types::Locale.optional
      end

      response_body Types::Array.member(Types::Price)
    end
  end
end
