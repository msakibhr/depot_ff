#---
# Excerpted from "Agile Web Development with Rails 6",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails6 for more book information.
#---
class StoreController < ApplicationController
  skip_before_action :authenticate_user!
  include CurrentCart
  before_action :set_cart
  def index
    @products = Product.order(:title)
    if session[:access_count].nil?
      session[:access_count] = 0
    end
    session[:access_count] += 1
    @access_count = session[:access_count]

  end
end