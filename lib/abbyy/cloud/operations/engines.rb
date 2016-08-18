class ABBYY::Cloud
  module Operations
    class Engines < Base
      # rubocop: disable Metrics/LineLength
      link "https://api.abbyy.cloud/swagger/ui/index#!/MachineTranslation/MachineTranslation_Engines"
      # rubocop: enable Metrics/LineLength
      path "mt/engines"
      http_method "get"

      response_body Types::Array.member(Types::Engine)
    end
  end
end
