# frozen_string_literal: true

module Pagos
  module Application
    module UseCases
      class RealizarPago
        def initialize(repository)
          @repository = repository
        end

        def execute(account_id:, amount:)
          pago = Pagos::Domain::Models::Payment.new(account_id: account_id, amount: amount)
          pago.mark_as_paid
          @repository.create(pago)
        end
      end
    end
  end
end
