require_relative "locale"
require_relative "ocr_warning"
require_relative "ocr_settings"
require_relative "ocr_statistics"
require_relative "reading_status"
require_relative "text_statistics"

class ABBYY::Cloud
  module Models
    class FileInfo < FileReference
      attribute :name,               Types::Strict::String
      attribute :mime,               Types::Strict::String
      attribute :created,            Types::Form::Time
      attribute :is_recognizable,    Types::Form::Bool
      attribute :is_deleted,         Types::Form::Bool
      attribute :reading_status,     Types::Strict::String
      attribute :reading_progress,   Types::Coercible::Int
      attribute :expected_languages, Types::Array.member(Types::Locale).optional
      attribute :processed,          Types::Form::Time.optional
      attribute :deleted,            Types::Form::Time.optional
      attribute :error,              Types::Strict::String.optional
      attribute :statistics,         Types::TextStatistics.optional
      attribute :ocr_settings,       Types::OcrSettings.optional
      attribute :ocr_statistics,     Types::OcrStatistics.optional
      attribute :ocr_warnings,
                Types::Array.member(Types::OcrWarning).optional
    end

    # Registers type Types::FileInfo
    Types.register_type FileInfo
  end
end
