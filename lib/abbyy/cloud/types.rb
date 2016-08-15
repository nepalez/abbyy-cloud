module ABBYY::Cloud::Types
  include Dry::Types.module

  ENGINES  = %w(Sandbox Bing Google Systran).freeze
  VERSIONS = [0].freeze

  # Gem-specific primitive types
  AuthId    = Strict::String
  AuthToken = Strict::String
  Engine    = Coercible::String.constrained(included_in: ENGINES)
  Language  = Strict::String.constrained(included_in: LANGUAGE)
  OrderId   = Strict::String
  Version   = Coercible::Int.constrained(included_in: VERSIONS)
end
