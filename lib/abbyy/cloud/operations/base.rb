# Base class for specific operations
# It validates request and response using corresponding structs
#
# @abstract
#
class ABBYY::Cloud
  module Operations
    class Base
      # Helpers to specify concrete operations
      class << self
        include Forwardable

        def http_method(value = nil)
          @http_method = value.to_s.capitalize if value
          @http_method || "Post"
        end

        def path(&block)
          block ? @path = block : @path
        end

        def link(value = nil)
          value ? @link = value : @link
        end

        def request_body(struct = nil, &block)
          provide_struct :@request_body, struct, &block
        end

        def request_query(struct = nil, &block)
          provide_struct :@request_query, struct, &block
        end

        def response_body(struct = nil, &block)
          provide_struct :@response_body, struct, &block
        end

        private

        def provide_struct(variable, struct, &block)
          value = instance_variable_get(variable)
          return value if value && struct.nil? && block.nil?

          struct ||= Class.new(Struct)
                          .tap { |obj| obj.instance_eval(&block) if block }

          instance_variable_set(variable, struct)
        end
      end

      include Dry::Initializer.define -> do
        param :settings
      end

      def_delegators :settings, :connection
      def_delegators :"self.class",
                     :link,
                     :http_method,
                     :path,
                     :request_body,
                     :request_query,
                     :response_body

      def call(**data)
        mash  = Hashie::Mash.new(data)
        url   = mash.instance_eval(&path)
        body  = prepare_request_body(data)
        query = prepare_request_query(data)
        res   = connection.call(http_method, url, body: body, query: query)

        handle_response_body(res)
      end

      private

      def prepare_request_body(data)
        request_body[data]
      rescue => error
        raise ArgumentError.new(link, data, error.message)
      end

      def prepare_request_query(data)
        request_query[data]
      rescue => error
        raise ArgumentError.new(link, data, error.message)
      end

      def handle_response_body(data)
        response_body[data]
      rescue => error
        raise TypeError.new(link, data, error.message)
      end
    end
  end
end
