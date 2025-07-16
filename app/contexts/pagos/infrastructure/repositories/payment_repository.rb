# frozen_string_literal: true

module Pagos
  module Infrastructure
    module Repositories
      class PaymentRepository
        def create(payment)
          PaymentRecord.create!(
            account_id: payment.account_id,
            amount: payment.amount,
            status: payment.status,
            paid_at: payment.paid_at
          )
        end

        def find(id)
          record = PaymentRecord.find(id)
          to_domain(record)
        end

        private

        def to_domain(record)
          Pagos::Domain::Models::Payment.new(
            account_id: record.account_id,
            amount: record.amount
          ).tap do |p|
            p.id = record.id
            p.status = record.status
            p.paid_at = record.paid_at
          end
        end
      end
    end
  end
end
