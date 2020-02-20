class ConnectsController < ApplicationController

  before_action :set_connect, only: :create

  def index
    @connect = Connect.new(amount: 150, currency: 'EUR', communication: 'Thanks Mom!')
  end

  def create

    if @connect.valid?
      if Fintecture.environment != 'production'
        @connect.customer_full_name = 'Test bot'
        @connect.customer_email = 'email@test.com'
        @connect.customer_ip = '192.168.0.1'
      end

      tokens = Fintecture::Pis.get_access_token

      pis_connect = Fintecture::Connect.get_pis_connect tokens['access_token'], @connect

      redirect_to pis_connect[:url]
    else
      render 'index'
    end

  end

  private

  def connect_params
    params.require(:connect).permit(
        :amount,
        :currency,
        :communication,
        :customer_full_name,
        :customer_email
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
