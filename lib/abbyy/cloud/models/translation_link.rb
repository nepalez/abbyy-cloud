require_relative "status"
require_relative "file_link"

class ABBYY::Cloud
  module Models
    class TranslationLink < Struct
      attribute :delivered, Types::Form::Time
      attribute :started, Types::Form::Time
      attribute :progress, Types::Coercible::Int
      attribute :status, Types::Status
      attribute :source_file, Types::FileLink
      attribute :target_file, Types::FileLink
    end

    # Registers type Types::TranslationLink
    Types.register_type TranslationLink
  end
end
