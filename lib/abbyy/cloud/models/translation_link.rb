require_relative "status"
require_relative "file_link"

class ABBYY::Cloud
  module Models
    class TranslationLink < Struct
      attribute :delivered,   Types::Form::Time.optional
      attribute :started,     Types::Form::Time.optional
      attribute :progress,    Types::Hash
      attribute :status,      Types::Status
      attribute :source_file, Types::FileLink
      attribute :target_file, Types::FileLink
    end

    # Registers type Types::TranslationLink
    Types.register_type TranslationLink
  end
end
