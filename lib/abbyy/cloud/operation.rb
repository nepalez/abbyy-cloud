# Base class for specific operations
# It validates request and response using corresponding structs
class ABBYY::Cloud::Operation
  class << self
    include Forwardable

    def http_method(value = nil)
      @http_method = value.to_s.capitalize if value
      @http_method || "Post"
    end

    def path(value = nil)
      value ? @path = value : @path
    end

    def request_body
      provide_struct :@request_body
    end

    def response_body
      provide_struct :@response_body
    end

    private

    def provide_struct(variable, &block)
      if block || instance_variable_get(variable).nil?
        struct = Class.new(Dry::Struct).instance_eval(&block)
        instance_variable_set(variable, struct)
      else
        instance_variable_get(variable)
      end
    end
  end

  def_delegators :class, :http_method, :path, :request_body, :response_body

  include Dry::Initializer.define -> do
    param  :connection
  end

  def call(**data)
    body = request_body[{ engine: engine }.merge(data)].to_h
    res  = connection.call http_method, relative_path, body: body
    response_body[res].to_h
  end
end
