class ABBYY::Cloud
  module Models
    # Price details
    class UnitPrice < Struct
      attribute :unit_type, Types::UnitType
      attribute :currency,  Types::Currency
      attribute :amount,    Types::Coercible::Float
    end

    # Registers type Types::UnitPrice
    Types.register_type UnitPrice
  end
end
