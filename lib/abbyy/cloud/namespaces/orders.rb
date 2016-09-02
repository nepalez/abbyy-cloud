require_relative "base"

class ABBYY::Cloud
  module Namespaces
    # Namespace for operations with orders
    # @see [https://api.abbyy.cloud/swagger/ui/index#!/Orders] ABBYY Cloud API
    class Orders < Base
      def create(options)
        Operations::SubmitOrder.new(settings).call(options)
      end
    end
  end
end
