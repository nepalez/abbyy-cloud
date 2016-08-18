require "dry-initializer"
require "dry-struct"
require "json"
require "net/http"
require "net/https"

module ABBYY
  class Cloud
    require_relative "cloud/struct"
    require_relative "cloud/types"
    require_relative "cloud/connection"
    require_relative "cloud/settings"

    require_relative "cloud/exceptions/response_error"
    require_relative "cloud/exceptions/argument_error"
    require_relative "cloud/exceptions/type_error"

    require_relative "cloud/models/error"
    require_relative "cloud/models/translation"
    require_relative "cloud/models/direction"
    require_relative "cloud/models/engine"

    require_relative "cloud/operations/base"
    require_relative "cloud/operations/translate"

    require_relative "cloud/namespaces/base"
    require_relative "cloud/namespaces/orders"

    attr_reader :settings

    def orders
      Namespaces::Orders.new(settings)
    end

    private

    def initialize(*args)
      @settings ||= Settings.new(*args)
    end
  end
end
