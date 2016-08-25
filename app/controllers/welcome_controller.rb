class WelcomeController < ApplicationController

  def index
    @books = Book.order("id DESC").limit(10)
  end
end
