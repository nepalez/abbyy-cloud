# Base class for specific operations
# It validates request and response using corresponding structs
#
# @abstract
#
class ABBYY::Cloud
  class Operation
    # Contains helper methods to specify concrete operations
    class << self
      include Forwardable

      def http_method(value = nil)
        @http_method = value.to_s.capitalize if value
        @http_method || "Post"
      end

      def path(value = nil)
        value ? @path = value : @path
      end

      def link(value = nil)
        value ? @link = value : @link
      end

      def request_body(struct = nil, &block)
        provide_struct :@request_body, struct, &block
      end

      def response_body(struct = nil, &block)
        provide_struct :@response_body, struct, &block
      end

      private

      def provide_struct(variable, struct, &block)
        if block || instance_variable_get(variable).nil?
          struct ||= Class.new(Struct).tap { |item| item.instance_eval(&block) }
          instance_variable_set(variable, struct)
        else
          instance_variable_get(variable)
        end
      end
    end

    def_delegators :"self.class",
                   :link,
                   :http_method,
                   :path,
                   :request_body,
                   :response_body

    include Dry::Initializer.define -> do
      param :connection
    end

    def call(**data)
      body = prepare_request_body(data)
      res  = connection.call(http_method, path, body: body)
      handle_response_body(res)
    end

    private

    def prepare_request_body(data)
      request_body[data]
    rescue => error
      raise ArgumentError.new(link, data, error.message)
    end

    def handle_response_body(data)
      response_body[data].to_h
    rescue => error
      raise TypeError.new(link, data, error.message)
    end
  end
end
