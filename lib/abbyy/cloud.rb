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

    Dir[
      "lib/abbyy/cloud/exceptions/*.rb",
      "lib/abbyy/cloud/models/*.rb",
      "lib/abbyy/cloud/operations/*.rb",
      "lib/abbyy/cloud/namespaces/*.rb"
    ].each { |f| require File.expand_path(f) }

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
