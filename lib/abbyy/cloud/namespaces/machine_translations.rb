class ABBYY::Cloud
  module Namespaces
    # Namespace for operations with machine translations
    # @see [https://api.abbyy.cloud/swagger/ui/index#!/MachineTranslation]
    class MachineTranslations < Base
      # Returns list of all available engines
      def engines
        Operations::Engines.new(settings).call
      end

      # Returns settigns for the engine selected by its name
      def engine(name)
        engines.find { |engine| engine.name == name }
      end
    end
  end
end
