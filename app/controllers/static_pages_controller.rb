class StaticPagesController < ApplicationController
  def landing_page
  	@featured_product = Product.second
  	@products = Product.limit(3)
  end

  def index
  end

end
