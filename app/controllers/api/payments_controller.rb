# frozen_string_literal: true

class Api::PaymentsController < ApplicationController
  def create
    byebug
    payment_params = params.require(:payment).permit(:account_id, :amount)
    repository = Pagos::Infrastructure::Repositories::PaymentRepository.new
    use_case = Pagos::Application::UseCases::RealizarPago.new(repository)

    use_case.execute(account_id: payment_params[:account_id], amount: payment_params[:amount].to_d)

    render json: { message: "Pago realizado con éxito" }, status: :created
  end
end
