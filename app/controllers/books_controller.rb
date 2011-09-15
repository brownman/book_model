class BooksController < ApplicationController
  before_filter :find_user , :only => [:index, :new]
  def index
    @books = @user.books

  end

  def show
    @book = Book.find(params[:id])
      #@user.books.find(params[:id])
@chapters = @book.chapters
  end

  def new
    @book = @user.books.build(params[:user_id])
  end

  def create
   # @book = @user.books.build(params[:book])
  @book = Book.new(params[:book])

    if @book.save
      redirect_to @book, :notice => "Successfully created book."
    else
      render :action => 'new'
    end
  end

  def edit
    @book = @user.books.find(params[:id])
  end

  def update
    @book = @user.books.find(params[:id])
    if @book.update_attributes(params[:book])
      redirect_to @book, :notice  => "Successfully updated book."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
user_id  = @book.user_id
    @book.destroy
    redirect_to books_path(:user_id => user_id), :notice => "Successfully destroyed book."
  end
  private
  def find_user
    @user = User.find(params[:user_id])
  end
end
