class BooksController < ApplicationController
   helper_method :sort_column, :sort_direction, :book_detail
  before_action :signed_in_user, only: [:create, :update, :destroy]
  before_action :correct_user,   only: :destroy

  def create
  	@book = current_user.books.build(book_params)
    @feed_items = current_user.feed.order(sort_column + " " + sort_direction).paginate(page: params[:page])
  	if @book.save
  		flash[:success]= "Book Shelfed!"
  		redirect_to root_url
  	else
  		render 'static_pages/home'
  	end
  end

  def destroy 
  	@book.destroy
    redirect_to root_url
  end

  def edit

  end

  def update
  end


  private

  	def book_params
  		params.require(:book).permit(:title, :author, :publisher, :copyright, :genre, :isbn)
  	end

  	def correct_user
  		@book = current_user.books.find_by(id: params[:id])
  		redirect_to root_url if @book.nil?
  	end

     def sort_column
      current_user.feed.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end
  
  def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
 