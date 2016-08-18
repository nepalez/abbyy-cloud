class ABBYY::Cloud
  module Operations
    class Translate < Base
      link "https://api.abbyy.cloud/swagger/ui/index#!/Order/Order_Translate"
      path "order/mt/sync"
      http_method "post"

      request_body do
        attribute :engine,          Types::Strict::String
        attribute :source_language, Types::Language
        attribute :target_language, Types::Language
        attribute :source_text,     Types::Strict::String
      end

      response_body Models::Translation
    end
  end
end
