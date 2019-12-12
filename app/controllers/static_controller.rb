class StaticController < ApplicationController
  def home
    @connect = Connect.new(amount: 150, currency: 'EUR', order_id: '123')
  end
end