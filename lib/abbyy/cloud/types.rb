module ABBYY::Cloud::Types
  include Dry::Types.module

  VERSIONS = [0].freeze
  UNIT_TYPES = %w(Chars Words Pages Documents).freeze
  DISCOUNT_TYPES = \
    %w(TMTextMatch TMTaggedTextMatch TMHalfContextMatch TMFullContextMatch)
    .freeze

  # Gem-specific primitive types
  Version      = Coercible::Int.constrained(included_in: VERSIONS)
  UnitType     = Strict::String.constrained(included_in: UNIT_TYPES)
  DiscountType = Strict::String.constrained(included_in: DISCOUNT_TYPES)
  Currency     = Strict::String.constrained(format: /\A[A-Z]{3}\z/)

  # Registers new coercible type from a struct class
  def self.register_type(struct, as: nil, constructor: :new)
    type_name  = Inflecto.underscore(as || struct.name.split("::").last)
    definition = Dry::Types::Definition.new(struct).constructor do |value|
      case value
      when nil    then raise
      when struct then value
      else struct.send(constructor, value)
      end
    end

    Dry::Types.register type_name, definition
    Dry::Types.define_constants self, [type_name]
  end

  register_type ::Time, as: "coercible.time", constructor: :parse
end
