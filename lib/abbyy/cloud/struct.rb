class ABBYY::Cloud::Struct < Dry::Struct
  class << self
    def new(data)
      default = schema.keys.each_with_object({}) { |key, hash| hash[key] = nil }
      actual  = data.to_hash.each_with_object({}) do |(key, val), hash|
        hash[key.to_sym] = val
      end

      super default.merge(actual)
    end
    alias_method :[], :new
  end
end
