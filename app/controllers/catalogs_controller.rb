class CatalogsController < ApplicationController
  before_action :set_cart_if_session

  layout "book_catalog_layout", only: [:index]
  layout "internal_layout", only: [:show]

  def index
    @books = Book.paginate(:page => params[:page], :per_page => 6).order("id DESC")
  end


  def show
    @book = Book.find params[:id]
  end

  private

  def set_cart_if_session
    set_cart if session[:cart_id]
  end

end
