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
    require_relative "cloud/connection"
    require_relative "cloud/operation"
    require_relative "cloud/operation/translate"

    include Dry::Initializer.define -> do
      option :id,      type: Types::AuthId
      option :token,   type: Types::AuthToken
      option :version, type: Types::Version, default: proc { 0 }
      option :engine,  type: Types::Engine,  default: proc { "Sandbox" }
    end

    def translate(text, from:, to:, **opts)
      Operation::Translate.new(connection).call source_text:     text,
                                                source_language: from,
                                                target_language: to,
                                                engine:          engine,
                                                **opts
    end

    private

    def connection
      @connection ||= Connection.new(version: version, id: id, token: token)
    end
  end
end
