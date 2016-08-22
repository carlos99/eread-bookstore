class WelcomeController < ApplicationController

  def index
    @books = Book.order("id DESC").limit(8)

  end
end
