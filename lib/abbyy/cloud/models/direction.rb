require_relative "locale"

class ABBYY::Cloud
  module Models
    class Direction < Struct
      attribute :source, Types::Locale
      attribute :target, Types::Locale
    end

    # Registers type Types::Direction
    Types.register_type Direction
  end
end
