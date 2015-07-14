class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
  	with: %r{\.(gif|jpg|png)\Z}i, 
  	message: 'must be a url for gif, jpg or png image.'
  }
  validates :title, length:{minimum: 10, 
    #messages pour le user
  	too_short: "must have at least %{count} words",
    too_long: "must have at most %{count} words"
  }
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
    def self.latest
      Product.order(:updated_at).last
    end 

private
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end


end
