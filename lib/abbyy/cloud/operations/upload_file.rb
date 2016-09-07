require_relative "base"

class ABBYY::Cloud
  module Operations
    class UploadFile < Base
      link "https://api.abbyy.cloud/swagger/ui/index#!/File/File_UploadFile"
      path { "v0/file" }
      http_method "post"

      request_type :file

      request_query do
        attribute :quality,       Types::OcrQuality
        attribute :synthesisMode, Types::OcrMode
        attribute :exportFormat,  Types::FileFormat
        attribute :languages,     Types::Array.member(Types::Locale)
      end

      response_body Models::FileInfo
    end
  end
end
