class ABBYY::Cloud
  module Models
    class OCRWarningType < ::String
      VALUES = %w(
        BrightnessIsTooHigh
        BrightnessIsTooLow
        ErrorWhenUsingDocumentAuxData
        NoRecognizableBlocksFound
        ProbablyLanguageIsIncorrect
        ResolutionIsLowForTinyTextPhoto
        ResolutionIsLowForTinyTextScanned
        ResolutionIsTooHigh
        ResolutionIsTooLow
        SuspiciousResolution
        TooManyBaseLanguages
        TooManyBaseLanguagesForDetection
        TooManyLanguagesDetected
        UnknownWarning
      ).freeze

      def self.new(string)
        super Types::Strict::String.constrained(included_in: VALUES)[string]
      end
    end

    # Registers type Types::OCRWarningType
    Types.register_type OCRWarningType
  end
end
