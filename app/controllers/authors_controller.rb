class AuthorsController < ApplicationController

  def index
    #code
  end

  def new

  end

  def show
    #require 'pry';binding.pry
    @author = Author.find(params[:id])
  end
end
