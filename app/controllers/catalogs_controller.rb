class CatalogsController < ApplicationController
  before_action :set_cart_if_session

  def index
    @books = Book.paginate(:page => params[:page], :per_page => 6)
  end

  def show
    @book = Book.find params[:id]
  end

  private

  def set_cart_if_session
    set_cart if session[:cart_id]
  end

end
