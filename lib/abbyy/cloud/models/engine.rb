require_relative "locale"
require_relative "direction"

class ABBYY::Cloud
  module Models
    class Engine < Model
      attribute :name,      type: Types::Strict::String
      attribute :languages, type: Types::Array.member(Types::Locale)
      attribute :translation_directions,
                type: Types::Array.member(Types::Direction)
    end

    # Registers type Types::Engine
    Types.register_type Engine
  end
end
