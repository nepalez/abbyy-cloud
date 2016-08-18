# Container for settings, that is initialized by [ABBYY::Cloud#initializer]
# and then shared by namespaces and operations.
class ABBYY::Cloud
  class Settings
    include Dry::Initializer.define -> do
      option :id,      type: Types::AuthId
      option :token,   type: Types::AuthToken
      option :version, type: Types::Version, default: proc { 0 }
      option :engine,  type: Types::Strict::String, default: proc { "Sandbox" }
    end

    def connection
      @connection ||= Connection.new(version: version, id: id, token: token)
    end
  end
end
