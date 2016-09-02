module ABBYY::Cloud::Types
  include Dry::Types.module

  VERSIONS = [0].freeze
  UNIT_TYPES = %w(Chars Words Pages Documents).freeze
  TRANSLATION_TYPES = %w(mt ht_express ht_professional ht_expert).freeze
  COST_TYPES = %w(Default SomeDiscounts AllDiscounts).freeze
  PAYMENT_TYPES = %w(Manual Balance External).freeze
  STATUSES = %w(New Submitted PaymentRequired Paid InProgress Done Failed
                Accepted ReworkRequired Canceled).freeze
  DISCOUNT_TYPES = \
    %w(TMTextMatch TMTaggedTextMatch TMHalfContextMatch TMFullContextMatch)
    .freeze

  # Gem-specific primitive types
  Version         = Coercible::Int.constrained(included_in: VERSIONS)
  UnitType        = Strict::String.constrained(included_in: UNIT_TYPES)
  DiscountType    = Strict::String.constrained(included_in: DISCOUNT_TYPES)
  CostType        = Strict::String.constrained(included_in: COST_TYPES)
  TranslationType = Strict::String.constrained(included_in: TRANSLATION_TYPES)
  PaymentType     = Strict::String.constrained(included_in: PAYMENT_TYPES)
  Status          = Strict::String.constrained(included_in: STATUSES)
  Currency        = Strict::String.constrained(format: /\A[A-Z]{3}\z/)
  Label           = Strict::String.constrained(format: /\A.{1,80}\z/)
  FilledArray     = Array.constrained(min_size: 1)

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
