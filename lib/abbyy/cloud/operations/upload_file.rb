require_relative "base"

class ABBYY::Cloud
  module Operations
    class UploadFile < Base
      link "https://api.abbyy.cloud/swagger/ui/index#!/File/File_UploadFile"
      path { "v0/file" }
      http_method "post"

      request_type :file

      request_query do
        attribute :quality,       Types::OcrQuality.optional
        attribute :synthesisMode, Types::OcrMode.optional
        attribute :exportFormat,  Types::FileFormat.optional
        attribute :languages,     Types::Array.member(Types::Locale).optional
      end

      response_body Types::Array.member(Types::FileInfo)
    end
  end
end
