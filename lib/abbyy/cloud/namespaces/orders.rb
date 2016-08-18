class ABBYY::Cloud
  module Namespaces
    # Namespace for operations with orders
    # @see [https://api.abbyy.cloud/swagger/ui/index#!/Order] ABBYY Cloud API
    class Orders < Base
      # Instantly (synchronously) translates the text
      #
      # @example
      #   translate "Hello world!", from: "en", to: "fr_FR"
      #
      # @param  [String] text
      # @option [ABBYY::Cloud::Types::Language] :from Source language
      # @option [ABBYY::Cloud::Types::Language] :to   Target language
      # @return [Hash<Symbol, Object>] translation
      #
      def translate(text, from:, to:, **opts)
        Operations::Translate.new(settings).call source_text:     text,
                                                 source_language: from,
                                                 target_language: to,
                                                 engine: settings.engine,
                                                 **opts
      end
    end
  end
end
