class Admin::BooksController < Admin::BaseController
  before_action :set_book, except: [:index, :new, :create]

  def index
    @books = Book.all.order("id DESC")
  end

  def show
  end

  def new
    @book = Book.new
    @authors = Author.all
    @publishers = Publisher.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = 'Book has been created'
      redirect_to [:admin, @book]
    else
      flash.now[:danger] = 'Book has not been created'
      @authors = Author.all
      @publishers = Publisher.all
      render :new
    end
  end

  def edit
    @publishers = Publisher.all
    @authors = Author.all
  end

  def update
    @publishers = Publisher.all
    if @book.update(book_params)
      flash[:success] = 'Book has been updated'
      redirect_to [:admin, @book]
    else
      flash[:danger] = 'Book has not been updated'
      render :edit
    end
  end

  def destroy

  if @book.destroy
    flash[:success] = 'Book has been deleted'
    redirect_to admin_books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :isbn, :page_count, :price, :description,
    :published_at, :publisher_id, :book_cover, :book_cover_cache, author_ids: [], book_category_ids: [])
  end

  def set_book
    @book = Book.find(params[:id])
  end

end
