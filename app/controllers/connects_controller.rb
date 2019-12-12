class ConnectsController < ApplicationController

  before_action :set_connect

  def create

    if @connect.valid?
      if Fintecture.environment != 'production'
        @connect.customer_full_name = 'Test bot'
        @connect.customer_email = 'email@test.com'
        @connect.customer_ip = '192.168.0.1'
        @connect.customer_id = 123
      end

      redirect_to Fintecture::Connect.connect_url_pis @connect
    else
      render 'static/home'
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
        origin_uri: ENV['redirect_url'].remove('/callback')
      }
    )
  end

  def model
    Connect
  end

  def set_connect
    @connect = model.new(payments_attributes)
  end
end
