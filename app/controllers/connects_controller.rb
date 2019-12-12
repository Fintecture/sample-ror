class ConnectController < ActionController::Base

  before_action :set_connect, only: :create

  def create

    if @connect.valid?
      if Fintecture.environment == 'production'
        @connect.customer_full_name: 'Test bot'
        @connect.customer_email: 'email@test.com'
        @connect.customer_ip: '192.168.0.1'
      end

      redirect_to Fintecture::Connect.connect_url_pis @connect
    end

  end

  private

  def connect_params
    params.require(:connect).permit(
        :amount,
        :currency,
        :order_id,
        :customer_id,
        :customer_full_name,
        :customer_email,
        :customer_id
    )
  end

  def payments_attributes
    connect_params.merge(
      {
        redirect_uri: ENV['redirect_url'],
        origin_uri: ''
      }
    )
  end

  def model
    Connect
  end

  def set_travel
    @connect = model.new(payments_attributes)
  end
end
