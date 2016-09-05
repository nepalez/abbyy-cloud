require_relative "base"

class ABBYY::Cloud
  module Operations
    class TranslateSegments < Base
      # rubocop: disable Metrics/LineLength
      link "https://api.abbyy.cloud/swagger/ui/index#!/Order/Order_TranslateSegments"
      # rubocop: enable Metrics/LineLength
      path { "v1/order/mt/sync" }
      http_method "post"

      request_body do
        attribute :engine,  Types::Strict::String
        attribute :from,    Types::Locale
        attribute :to,      Types::Locale
        attribute :sources, Types::Array.member(Types::SourceSegment)
      end

      response_body Types::Array.member(Types::TranslationSegment)
    end
  end
end
