require "dry-initializer"
require "dry-struct"
require "hashie/mash"
require "json"
require "net/http"
require "net/https"

module ABBYY
  class Cloud
    require_relative "cloud/struct"
    require_relative "cloud/types"
    require_relative "cloud/connection"
    require_relative "cloud/settings"

    %w(exceptions models operations namespaces).each do |dir|
      path = File.expand_path("lib/abbyy/cloud/#{dir}/**")
      Dir[path].each { |file| require file }
    end

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

    def files
      Namespaces::Files.new(settings)
    end

    private

    def initialize(*args)
      @settings ||= Settings.new(*args)
    end
  end
end
