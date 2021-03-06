class Admin::AuthorsController < Admin::BaseController
  before_action :require_sign_in
  before_action :require_admin
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.all
  end

  def show
    #require 'pry';binding.pry
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:success] = "Author has been created"
      redirect_to [:admin, @author]
    else
      flash[:danger] = "Author has not been created"
      render :new
    end
  end

  def edit
  end

  def update
    if @author.update(author_params)
      flash[:success] = "Author has been updated"
      redirect_to [:admin, @author]
    else
      flash[:danger] = "Author has not been updated"
      render :edit
    end
  end

  def destroy
    @author.destroy
    flash[:success] = "Author has been deleted"
    redirect_to admin_authors_path
  end

  private

    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:first_name, :last_name)
    end
end
