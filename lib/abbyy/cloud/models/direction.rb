class ABBYY::Cloud
  module Models
    # Description of the translation direction
    class Direction < Struct
      attribute :source, Types::Language
      attribute :target, Types::Language
    end

    # Registers type Types::Direction
    Types.register_type Direction
  end
end
