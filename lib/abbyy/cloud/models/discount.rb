require_relative "discount_type"

class ABBYY::Cloud
  module Models
    class Discount < Struct
      attribute :discount_type, Types::DiscountType
      attribute :discount,      Types::Coercible::Float
    end

    # Registers type Types::Discount
    Types.register_type Discount
  end
end
