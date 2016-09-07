require_relative "base"

class ABBYY::Cloud
  module Namespaces
    # Namespace for operations with orders
    # @see [https://api.abbyy.cloud/swagger/ui/index#!/File] ABBYY Cloud API
    class Files < Base
      def download(id:, token:)
        Operations::DownloadFile.new(settings).call(id: id, token: token)
      end
    end
  end
end
