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

    include Dry::Initializer.define -> do
      option :id,      type: Types::AuthId
      option :token,   type: Types::AuthToken
      option :version, type: Types::Version, default: proc { 0 }
      option :engine,  type: Types::Engine,  default: proc { "Sandbox" }
    end
  end
end
