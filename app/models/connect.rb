class Connect

  include ActiveModel::Model
  attr_accessor :amount,
                :currency,
                :communication,
                :customer_ip,
                :customer_full_name,
                :customer_email,
                :redirect_uri,
                :origin_uri,
                :psu_type,
                :country

  validates :currency, :redirect_uri, :communication, presence: true
  validates :amount, numericality: {greater_than: 0}

  validates :customer_ip, :customer_full_name, :customer_email, presence: true, if: -> { Fintecture.environment == 'production' }
end
