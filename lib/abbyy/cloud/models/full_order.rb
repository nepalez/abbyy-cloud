require_relative "currency"
require_relative "order_statistics"
require_relative "label"
require_relative "locale"
require_relative "payment_type"
require_relative "status"
require_relative "translation_link"
require_relative "translation_type"
require_relative "unit_type"

class ABBYY::Cloud
  module Models
    class FullOrder < Struct
      attribute :amount, Types::Coercible::Float
      attribute :approval_required, Types::Form::Bool
      attribute :created, Types::Form::Time
      attribute :currency, Types::Currency
      attribute :deadline, Types::Form::Time.optional
      attribute :deleted, Types::Form::Time.optional
      attribute :delivered, Types::Form::Time.optional
      attribute :email, Types::Strict::String
      attribute :from, Types::Locale
      attribute :id, Types::Strict::String
      attribute :is_deleted, Types::Form::Bool
      attribute :is_layout_required, Types::Form::Bool
      attribute :is_manual_estimation, Types::Form::Bool
      attribute :label, Types::Label.optional
      attribute :number, Types::Coercible::Int
      attribute :payment_provider, Types::Strict::String
      attribute :payment_type, Types::PaymentType
      attribute :progress, Types::Coercible::Int
      attribute :started, Types::Form::Time.optional
      attribute :statistics, Types::OrderStatistics
      attribute :status, Types::Status
      attribute :to, Types::FilledArray.member(Types::Locale)
      attribute :translations, Types::Array.member(Types::TranslationLink)
      attribute :type, Types::TranslationType
      attribute :unit_count, Types::Coercible::Int
      attribute :unit_type, Types::UnitType
      attribute :units_count, Types::Hash
    end

    # Registers type Types::FullOrder
    Types.register_type FullOrder
  end
end
