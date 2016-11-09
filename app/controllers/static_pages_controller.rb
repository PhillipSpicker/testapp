class StaticPagesController < ApplicationController
  def landing_page
  	@featured_product = Product.second
  end

  def index
  end

end
