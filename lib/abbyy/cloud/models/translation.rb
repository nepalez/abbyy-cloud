class ABBYY::Cloud
  # Collection of models returned in requests
  module Models
    # Result of the order translation
    class Translation < Struct
      attribute :id,          Types::Strict::String
      attribute :translation, Types::Strict::String
    end
  end
end
