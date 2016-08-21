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

    attr_reader :root

    def call(http_method, path, **options)
      uri = prepare_uri(path, options)
      req = Net::HTTP.const_get(http_method.capitalize).new(uri)
      setup_headers(req, options)
      setup_body(req, options)

      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(req)
      end
      handle_response(res)
    end

    private

    def initialize(*)
      super
      @root = URI("https://api.abbyy.cloud")
              .merge("v#{version}/")
              .tap { |item| item.scheme = "https" }
    end

    def prepare_uri(path, query: nil, **)
      uri   = root.merge(path)
      query = query.to_h.map { |k, v| "#{k}=#{v}" if v }.compact.join("&")
      uri.query = query unless query.empty?
      uri
    end

    def setup_headers(req, headers: nil, **)
      req.basic_auth id, token
      req["accept-charset"] = "utf-8"
      req["accept"]         = "application/json"
      req["content-type"]   = "application/json"
      headers.to_h.each { |key, value| req[key.to_s] = value }
    end

    def setup_body(req, body: nil, **)
      return unless req["content-type"] == "application/json"
      req.body = JSON(body.to_h)
    end

    def handle_response(response)
      raise ResponseError.new(response) unless response.is_a? Net::HTTPSuccess
      JSON.parse(response.body)
    end
  end
end
