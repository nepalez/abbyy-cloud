require_relative "file_format"
require_relative "ocr_mode"
require_relative "ocr_quality"

class ABBYY::Cloud
  module Models
    class OcrSettings < Struct
      attribute :format,  Types::FileFormat
      attribute :mode,    Types::OcrMode
      attribute :quality, Types::OcrQuality
    end

    # Registers type Types::OcrSettings
    Types.register_type OcrSettings
  end
end
