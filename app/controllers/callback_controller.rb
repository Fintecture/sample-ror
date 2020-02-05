class CallbackController < ActionController::Base

  def callback
    @success_payment = params[:status] == 'payment_created' || params[:status] == 'payment_pending'

    tokens = Fintecture::Pis.get_access_token

    session_id = params[:session_id]

    payment_response = Fintecture::Pis.get_payments tokens['access_token'], session_id
    payment_response_body = JSON.parse payment_response.body

    @verified = (payment_response_body['meta']['status'] === 'payment_created')
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
