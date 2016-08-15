module ABBYY::Cloud::Types
  include Dry::Types.module

  ENGINES  = %w(Sandbox Bing Google Systran).freeze
  VERSIONS = [0].freeze
  LANGUAGE = /\A[a-z]{2}(_[A-Z]{2})?\z/

  # Gem-specific primitive types
  AuthId    = Strict::String
  AuthToken = Strict::String
  Engine    = Coercible::String.constrained(included_in: ENGINES)
  Language  = Strict::String.constrained(format: LANGUAGE)
  OrderId   = Strict::String
  Version   = Coercible::Int.constrained(included_in: VERSIONS)
end
