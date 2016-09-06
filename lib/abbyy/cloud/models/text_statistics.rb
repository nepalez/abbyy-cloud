require_relative "source_tag"

class ABBYY::Cloud
  module Models
    class TextStatistics < Struct
      attribute :language,    Types::Locale
      attribute :pages_count, Types::Coercible::Int
      attribute :words_count, Types::Coercible::Int
      attribute :chars_count, Types::Coercible::Int
    end

    # Registers type Types::TextStatistics
    Types.register_type TextStatistics
  end
end
