module ABBYY::Cloud::Types
  include Dry::Types.module

  ENGINES  = %w(Bing Google Compreno Systran Mock Sandbox).freeze
  VERSIONS = [0].freeze
  LANGUAGE = /\A[a-z]{2}(-[A-Za-z]+)*\z/

  # Gem-specific primitive types
  AuthId    = Strict::String
  AuthToken = Strict::String
  Language  = Strict::String.constrained(format: LANGUAGE)
  OrderId   = Strict::String
  Version   = Coercible::Int.constrained(included_in: VERSIONS)

  # Registers new coercible type from a struct class
  def self.register_type(struct, as: nil)
    type_name  = as || struct.name.split("::").last.downcase
    definition = Dry::Types::Definition.new(struct).constructor do |value|
      case value
      when nil    then nil
      when struct then value
      else struct[value]
      end
    end

    Dry::Types.register type_name, definition
    Dry::Types.define_constants self, [type_name]
  end
end
