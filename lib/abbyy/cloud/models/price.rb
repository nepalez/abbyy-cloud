require_relative "locale"
require_relative "unit_price"
require_relative "discount"

class ABBYY::Cloud
  module Models
    # Price details
    class Price < Struct
      attribute :id,          Types::Strict::String
      attribute :account_id,  Types::Strict::String
      attribute :type,        Types::Strict::String
      attribute :from,        Types::Locale
      attribute :to,          Types::Locale
      attribute :unit_prices, Types::Array.member(Types::UnitPrice)
      attribute :discounts,   Types::Array.member(Types::Discount)
      attribute :created,     Types::Coercible::Time
    end

    # Registers type Types::Price
    Types.register_type Price
  end
end
