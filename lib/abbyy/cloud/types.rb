module ABBYY::Cloud::Types
  include Dry::Types.module

  VERSIONS = [0].freeze
  LOCALE   = /\A[A-Za-z0-9]{2,}(-[A-Za-z0-9]+)*\z|\A[i|x](-[A-Za-z0-9]+)+\z/

  # Gem-specific primitive types
  AuthId    = Strict::String
  AuthToken = Strict::String
  OrderId   = Strict::String
  Version   = Coercible::Int.constrained(included_in: VERSIONS)

  # Registers new coercible type from a struct class
  def self.register_type(struct, as: nil)
    type_name  = as || struct.name.split("::").last.downcase
    definition = Dry::Types::Definition.new(struct).constructor do |value|
      case value
      when nil    then raise
      when struct then value
      else struct[value]
      end
    end

    Dry::Types.register type_name, definition
    Dry::Types.define_constants self, [type_name]
  end
end
