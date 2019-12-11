class UrlConnectController < ActionController::Base

  def create
    @amount, @currency, @communication = params[:object].values

    if @amount.blank? or @currency.blank? or @communication.blank?
      raise "I need a value for Amount, Currency and Communication"
    end

    payment_attrs = {
        amount: @amount,
        currency: @currency,
        order_id: @communication,
        customer_id: 1,
        customer_full_name: 'Test bot',
        customer_email: 'email@test.com',
        customer_ip: '192.168.0.1',
        redirect_uri: ENV['redirect_url'],
        origin_uri: ''
    }

    redirect_to Fintecture::Connect.connect_url_pis(payment_attrs)
  end

  private

  def allowed_params
    params.require(:object).permit(
        :amount,
        :currency,
        :communication
    )
  end
end
