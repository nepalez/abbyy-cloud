require_relative "source_tag"

class ABBYY::Cloud
  module Models
    class OrderStatistics < Struct
      attribute :documents_count, Types::Coercible::Int
      attribute :pages_count,     Types::Coercible::Int
      attribute :words_count,     Types::Coercible::Int
      attribute :chars_count,     Types::Coercible::Int
    end

    # Registers type Types::OrderStatistics
    Types.register_type OrderStatistics
  end
end
