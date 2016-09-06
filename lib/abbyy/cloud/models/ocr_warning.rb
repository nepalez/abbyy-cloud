require_relative "ocr_warning_type"

class ABBYY::Cloud
  module Models
    class OcrWarning < Struct
      attribute :warning_type,         Types::OcrWarningType
      attribute :page_number,          Types::Coercible::Int
      attribute :dpi,                  Types::Coercible::Int.optional
      attribute :language_count,       Types::Coercible::Int.optional
      attribute :full_warning_message, Types::Strict::String.optional
    end

    # Registers type Types::OcrWarning
    Types.register_type OcrWarning
  end
end
