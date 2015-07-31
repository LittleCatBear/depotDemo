class StoreController < ApplicationController
	include CurrentCart
  before_filter :set_cart
  def index
  	#range les produits par ordre alphabétique
  	@products = Product.order(:title)
  	@time =  Time.now
  	@count = inc_counter
  end

  def inc_counter
  	if session[:counter].nil?
  		return session[:counter] = 0
  	else 
  		return session[:counter] += 1
  	end
  end
end
