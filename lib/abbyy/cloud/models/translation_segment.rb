require_relative "transfer_data"

class ABBYY::Cloud
  module Models
    # A segment of the translation
    class TranslationSegment < Struct
      attribute :id,   Types::Strict::String
      attribute :text, Types::Strict::String
      attribute :tags_transfer_data,
                Types::Array.member(Types::TransferData).default([])
    end

    # Registers type Types::TranslationSegment
    Types.register_type TranslationSegment
  end
end
