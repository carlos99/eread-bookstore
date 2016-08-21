class WelcomeController < ApplicationController

  def index
    @books = Book.order("id DESC").limit(6)
  end
end
