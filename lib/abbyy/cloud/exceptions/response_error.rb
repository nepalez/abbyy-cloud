# The exception to be risen when ABBYY Cloud API responded with error status.
# It takes a raw Net::HTTPResponse and extracts all the data returned by API.
class ABBYY::Cloud
  class ResponseError < StandardError
    class Data < Struct
      attribute :request_id,        Types::Coercible::String.optional
      attribute :error,             Types::Coercible::String.optional
      attribute :error_description, Types::Coercible::String.optional
      attribute :model_state,       Types::Hash.optional
    end

    attr_reader :status, :data

    def initialize(response)
      @data   = Data[JSON.parse(response.body)]
      @status = response.code.to_i

      super <<-MESSAGE.gsub(/ +\|/, "")
        |ABBYY Cloud API responded to the request {data.request_id} with a status #{status}
        |  error:       #{data.error}
        |  description: #{data.error_description}
        |  model_state: #{data.model_state}
      MESSAGE
    end
  end
end