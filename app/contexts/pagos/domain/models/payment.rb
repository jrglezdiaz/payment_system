# frozen_string_literal: true

module Pagos
  module Domain
    module Models
      class Payment
        attr_accessor :id, :account_id, :amount, :status, :paid_at

        def initialize(account_id:, amount:)
          @account_id = account_id
          @amount = amount
          @status = 'pending'
          @paid_at = nil
        end

        def mark_as_paid
          @status = 'paid'
          @paid_at = Time.now
        end
      end
    end
  end
end
