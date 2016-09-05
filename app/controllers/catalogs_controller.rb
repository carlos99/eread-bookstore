class CatalogsController < ApplicationController

  #layout 'internal_layout'
  before_action :set_cart_if_session

  def index
    @books = Book.paginate(:page => params[:page], :per_page => 6).order("id DESC")
  end

  layout 'internal_layout'
  def show
    @book = Book.find params[:id]
  end

  private

  def set_cart_if_session
    set_cart if session[:cart_id]
  end

end
