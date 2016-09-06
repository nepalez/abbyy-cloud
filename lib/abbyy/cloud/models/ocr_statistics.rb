class ABBYY::Cloud
  module Models
    class OcrStatistics < Struct
      attribute :exported_pages,       Types::Coercible::Int
      attribute :total_characters,     Types::Coercible::Int
      attribute :uncertain_characters, Types::Coercible::Int
      attribute :success_part,         Types::Coercible::Float
    end

    # Registers type Types::OcrStatistics
    Types.register_type OcrStatistics
  end
end
