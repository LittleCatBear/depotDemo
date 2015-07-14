class LineItem < ActiveRecord::Base
  belongs_to :product
  # == foreign key
  belongs_to :cart
  attr_accessible :title, :body, :product
end
