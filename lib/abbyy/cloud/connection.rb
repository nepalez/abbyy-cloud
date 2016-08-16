# Underlying Net::HTTP-based connection responds for sending requests
# and handling responses depending on their statuses.
#
# It validates neither request's, no response's contents.
# Those are provided by [ABBYY::Cloud::Operation] and its subclasses.
#
class ABBYY::Cloud
  class Connection
    include Dry::Initializer.define -> do
      option :version
      option :id
      option :token
    end

    def call(http_method, path, body: {}, headers: {})
      uri = root.merge(path).tap { |item| item.scheme = "https" }
      req = prepare_request(http_method, uri, body, headers)

      Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        handle_response http.request(req)
      end
    end

    private

    def root
      @root ||= URI("https://api.abbyy.cloud").merge("v#{version}")
    end

    def prepare_request(http_method, uri, body, headers)
      Net::HTTP.const_get(http_method.capitalize).new(uri).tap do |req|
        req.body = body
        req.basic_auth id, token
        req["accept-charset"] = "utf-8"
        req["accept"] = "application/json"
        req["content-type"] = "application/json"
        headers.each { |key, value| req[key.to_s] = value }
      end
    end

    def handle_response(response)
      raise ResponseError.new(response) unless response.is_a? Net::HTTPSuccess
      JSON.parse(response.body)
    end
  end
end
