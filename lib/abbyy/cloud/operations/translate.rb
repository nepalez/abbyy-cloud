require_relative "base"

class ABBYY::Cloud
  module Operations
    class Translate < Base
      link "https://api.abbyy.cloud/swagger/ui/index#!/Order/Order_Translate"
      path "v0/order/mt/sync"
      http_method "post"

      request_body do
        attribute :engine,          Types::Strict::String
        attribute :source_language, Types::Locale
        attribute :target_language, Types::Locale
        attribute :source_text,     Types::Strict::String
      end

      response_body Models::Translation
    end
  end
end
