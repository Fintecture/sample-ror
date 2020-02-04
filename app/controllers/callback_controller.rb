class CallbackController < ActionController::Base

  def callback
    @success_payment = params[:status] == 'payment_created' || params[:status] == 'payment_pending'
    @verified = Fintecture::Connect.verify_url_parameters connect_allowed_params
  end

  def ais_callback

  end

  def pis_callback

  end

  private

  def connect_allowed_params
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
