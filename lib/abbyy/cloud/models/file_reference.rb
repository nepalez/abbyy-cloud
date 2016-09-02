class ABBYY::Cloud
  module Models
    # Reference to uploaded file
    class FileReference < Struct
      attribute :id,    Types::Strict::String
      attribute :token, Types::Strict::String
    end

    # Registers type Types::FileReference
    Types.register_type FileReference
  end
end
