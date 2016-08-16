class ABBYY::Cloud
  class Operation
    class Translate < Operation
      link "https://api.abbyy.cloud/swagger/ui/index#!/Order/Order_Translate"
      path "order/mt/sync"
      http_method "post"

      request_body do
        attribute :engine,          Types::Engine
        attribute :source_language, Types::Language
        attribute :target_language, Types::Language
        attribute :source_text,     Types::Strict::String
      end

      response_body do
        attribute :id,          Types::OrderId
        attribute :translation, Types::Strict::String
      end
    end
  end
end
