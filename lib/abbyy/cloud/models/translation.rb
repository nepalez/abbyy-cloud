class ABBYY::Cloud
  module Models
    class Translation < Struct
      attribute :id,          Types::Strict::String
      attribute :translation, Types::Strict::String
    end
  end
end
