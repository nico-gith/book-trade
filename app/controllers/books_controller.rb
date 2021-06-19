class BooksController < ApplicationController

  def index
    @books = Book.where(user_id: current_user.id)
    @check = Check.new

  end

  def search
     @search = Book.ransack(params[:q])  #search_fieldの検索条件がparams[:q]に格納される
     @result = @search.result          #検索結果を返す
     @check = Check.new
     @trades = Trade.all
  end

  def reqest #requestはコントローラで使用出来ない
     @books = Book.all
     @check = Check.new
     @mytrades = Trade.where(user_id: current_user.id)
  end

  def specific
     @books = Book.where(user_id: params[:user_id])
     @check = Check.new
     @trades = Trade.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
       redirect_to books_path, notice: '追加に成功しました'
    else
       flash.now[:alert] = '追加に失敗しました'
       render :new
    end
  end

  def destroy
    @trade = Trade.find_by(user_id: current_user , book_id: params[:book_id])
    @trade.destroy
    redirect_to books_reqest_path, notice: '本の登録を解除しました'
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :publisher, :image, :description)
  end

end
