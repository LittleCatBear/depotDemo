class StoreController < ApplicationController
  def index
  	#range les produits par ordre alphabétique
  	@products = Product.order(:title)
  end
end
