class Admin::BookCategoriesController < Admin::BaseController
  before_action :require_sign_in
  before_action :require_admin
  before_action :set_book_category, only: [:show, :edit, :update, :destroy]

  def index
    @book_categories = BookCategory.all
  end

  def show
  end

  def new
    @book_category = BookCategory.new
  end

  def create
    @book_category = BookCategory.new(book_category_params)
    if @book_category.save
      flash[:success] = "Book Category has been created"
      redirect_to [:admin, @book_category]
    else
      flash[:danger] = "Book Category has not been created"
      render :new
    end
  end

  def edit
  end

  def update
    if @book_category.update(book_category_params)
      flash[:success] = "Book Category has been updated"
      redirect_to [:admin, @book_category]
    else
      flash[:danger] = "Book Category has not been updated"
      render :edit
    end
  end

  def destroy
    @book_category.destroy
    flash[:success] = "Book Category has been deleted"
    redirect_to admin_book_categories_path
  end

  private

    def set_book_category
      @book_category = BookCategory.find(params[:id])
    end

    def book_category_params
      params.require(:book_category).permit(:name)
    end

end
