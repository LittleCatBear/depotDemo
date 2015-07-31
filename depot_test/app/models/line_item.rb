class LineItem < ActiveRecord::Base
  belongs_to :product
  # == foreign key
  belongs_to :cart
  attr_accessible :title, :body, :product, :product_id

  def total_price
  	product.price * quantity
  end
end
