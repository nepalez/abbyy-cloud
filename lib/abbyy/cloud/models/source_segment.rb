require_relative "source_tag"

class ABBYY::Cloud
  module Models
    # A segment for the translation
    class SourceSegment < Struct
      attribute :text, Types::Strict::String
      attribute :tags, Types::Array.member(Types::SourceTag).default([])
    end

    # Registers type Types::SourceSegment
    Types.register_type SourceSegment
  end
end
