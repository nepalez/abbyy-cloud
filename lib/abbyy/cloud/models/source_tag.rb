class ABBYY::Cloud
  module Models
    TYPES = %w(Start End Placeholder).freeze

    class SourceTag < Struct
      attribute :number, Types::Strict::Int
      attribute :position, Types::Strict::Int
      attribute :type, Types::Strict::String.constrained(included_in: TYPES)
    end

    # Registers type Types::SourceTag
    Types.register_type SourceTag
  end
end
