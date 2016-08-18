require "dry-initializer"
require "dry-struct"
require "dry-types"
require "json"
require "net/http"
require "net/https"

module ABBYY
  class Cloud
    require_relative "cloud/struct"
    require_relative "cloud/types"
    require_relative "cloud/response_error"
    require_relative "cloud/argument_error"
    require_relative "cloud/type_error"
    require_relative "cloud/connection"
    require_relative "cloud/settings"
    require_relative "cloud/operation"
    require_relative "cloud/operation/translate"

    attr_reader :settings

    def translate(text, from:, to:, **opts)
      Operation::Translate.new(settings).call source_text:     text,
                                              source_language: from,
                                              target_language: to,
                                              engine: settings.engine,
                                              **opts
    end

    private

    def initialize(*args)
      @settings ||= Settings.new(*args)
    end
  end
end
