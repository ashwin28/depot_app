class StoreController < ApplicationController
  include SessionCounter, CurrentCart

  before_action :set_cart
  before_action :set_count, only: [:index]

  def index
    @products = Product.order(:title)
  end
end
