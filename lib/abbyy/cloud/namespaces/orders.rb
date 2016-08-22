require_relative "base"

class ABBYY::Cloud
  module Namespaces
    # Namespace for operations with orders
    # @see [https://api.abbyy.cloud/swagger/ui/index#!/Order] ABBYY Cloud API
    class Orders < Base
      # Instantly (synchronously) translates the text
      #
      # @example (see ABBYY::Cloud::Namespaces::MachineTranslations#translate)
      # @param   (see ABBYY::Cloud::Namespaces::MachineTranslations#translate)
      # @option  (see ABBYY::Cloud::Namespaces::MachineTranslations#translate)
      # @return  (see ABBYY::Cloud::Namespaces::MachineTranslations#translate)
      #
      def translate(*args)
        Namespaces::MachineTranslations.new(settings).translate(*args)
      end
    end
  end
end
