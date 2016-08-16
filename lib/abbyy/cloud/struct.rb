class ABBYY::Cloud::Struct < Dry::Struct
  def self.[](data)
    default = schema.keys.each_with_object({}) { |key, hash| hash[key] = nil }
    actual  = data.to_hash.each_with_object({}) do |(key, val), hash|
      hash[key.to_sym] = val
    end

    new default.merge(actual)
  end
end
