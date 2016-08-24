class ABBYY::Cloud
  module Models
    # Tag for translation source/target
    class TransferData < Struct
      attribute :position, Types::Strict::Int
      attribute :order,    Types::Strict::Int
    end

    # Registers type Types::TransferData
    Types.register_type TransferData
  end
end
