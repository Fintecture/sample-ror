class CallbackController < ActionController::Base

  def callback
    @success_payment = params[:status] == 'payment_created' || params[:status] == 'payment_pending'
    @verified = Fintecture::Connect.verify_url_parameters allowed_params
  end

  private

  def allowed_params
    params.permit(
        :session_id,
        :status,
        :customer_id,
        :provider,
        :state,
        :s
    )
  end
end
