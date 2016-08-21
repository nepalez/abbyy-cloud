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
    require_relative "cloud/models/locale"
    require_relative "cloud/models/translation"
    require_relative "cloud/models/direction"
    require_relative "cloud/models/engine"
    require_relative "cloud/models/unit_price"
    require_relative "cloud/models/discount"
    require_relative "cloud/models/price"

    require_relative "cloud/operations/base"
    require_relative "cloud/operations/translate"
    require_relative "cloud/operations/engines"
    require_relative "cloud/operations/prices"

    require_relative "cloud/namespaces/base"
    require_relative "cloud/namespaces/orders"
    require_relative "cloud/namespaces/machine_translations"
    require_relative "cloud/namespaces/prices"

    attr_reader :settings

    def mt
      Namespaces::MachineTranslations.new(settings)
    end

    def orders
      Namespaces::Orders.new(settings)
    end

    def prices
      Namespaces::Prices.new(settings)
    end

    private

    def initialize(*args)
      @settings ||= Settings.new(*args)
    end
  end
end
