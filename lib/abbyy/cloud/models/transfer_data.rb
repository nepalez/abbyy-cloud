class ABBYY::Cloud
  module Models
    class TransferData < Struct
      attribute :position, Types::Strict::Int
      attribute :order,    Types::Strict::Int
    end

    # Registers type Types::TransferData
    Types.register_type TransferData
  end
end
