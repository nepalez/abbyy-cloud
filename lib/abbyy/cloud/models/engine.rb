class ABBYY::Cloud
  # Collection of models returned in requests
  module Models
    # Description of the engine
    class Engine < Struct
      attribute :name,                   Types::Strict::String
      attribute :languages,              Types::Array.member(Types::Language)
      attribute :translation_directions, Types::Array.member(Types::Direction)
    end

    # Registers type Types::Engine
    Types.register_type Engine
  end
end
