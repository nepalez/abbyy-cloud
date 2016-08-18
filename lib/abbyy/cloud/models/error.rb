class ABBYY::Cloud
  # Collection of models returned in requests
  module Models
    # An error returned by the server in case of wrong response
    class Error < Struct
      attribute :request_id,        Types::Coercible::String.optional
      attribute :error,             Types::Coercible::String.optional
      attribute :error_description, Types::Coercible::String.optional
      attribute :model_state,       Types::Hash.optional
    end
  end
end
