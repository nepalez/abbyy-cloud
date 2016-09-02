class ABBYY::Cloud
  # Collection of models returned in requests
  module Models
    # Link to results of async translation
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
