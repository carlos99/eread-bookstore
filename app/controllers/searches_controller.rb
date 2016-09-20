class SearchesController < ApplicationController

	def index
     @books = Book.where(["LOWER(title) LIKE ?","%#{params[:search]}%"])
    respond_to do |format|
      format.html
      format.json { render json: searches_path }
    end
  end
end
