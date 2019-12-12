class Connect

  include ActiveModel::Model
  attr_accessor :amount,
                :currency,
                :order_id,
                :customer_id,
                :customer_ip,
                :customer_full_name,
                :customer_email,
                :redirect_uri,
                :origin_uri

  validates :currency, :redirect_uri, :order_id, presence: true
  validates :amount, numericality: {greater_than: 0}

  validates :customer_ip, :customer_full_name, :customer_email, presence: true, if: -> { Fintecture.environment == 'production' }
  validates :customer_id, numericality: {greater_than: 0, allow_blank: false}, if: -> { Fintecture.environment == 'production' }
end
