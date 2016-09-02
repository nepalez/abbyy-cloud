class ABBYY::Cloud
  module Models
    # Reference to uploaded translation
    class FileLink < FileReference
      attribute :name,        Types::Strict::String
      attribute :language,    Types::Locale
      attribute :is_deleted,  Types::Form::Bool
      attribute :chars_count, Types::Coercible::Int.optional
      attribute :words_count, Types::Coercible::Int.optional
      attribute :pages_count, Types::Coercible::Int.optional
    end

    # Registers type Types::FileLink
    Types.register_type FileLink
  end
end
