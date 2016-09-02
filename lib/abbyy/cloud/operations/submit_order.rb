require_relative "base"

class ABBYY::Cloud
  module Operations
    class SubmitOrder < Base
      # rubocop: disable Metrics/LineLength
      link "https://api.abbyy.cloud/swagger/ui/index#!/Order/Order_SubmitOrder_0"
      # rubocop: enable Metrics/LineLength
      path "v0/order"
      http_method "post"

      request_body do
        attribute :type, Types::TranslationType
        attribute :email, Types::Strict::String.optional
        attribute :contact_culture, Types::Strict::String.optional
        attribute :contact_utc_offset, Types::Coercible::String.optional
        attribute :mt_engine, Types::Strict::String
        attribute :approval_required, Types::Form::Bool
        attribute :is_manual_estimation, Types::Form::Bool
        attribute :cost_type, Types::CostType
        attribute :unit_type, Types::UnitType
        attribute :currency, Types::Currency
        attribute :from, Types::Locale
        attribute :label, Types::Label.optional
        attribute :to, Types::FilledArray.member(Types::Locale)
        attribute :files, Types::FilledArray.member(Types::FileReference)
      end

      response_body Models::FullOrder
    end
  end
end
