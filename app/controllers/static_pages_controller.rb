require 'openlibrary'

class StaticPagesController < ApplicationController
        helper_method :sort_column, :sort_direction, :book_detail
        

  def home
    if signed_in?
      @book = current_user.books.build
      @feed_items = current_user.feed.order(sort_column + " " + sort_direction).paginate(page: params[:page])
    end
    @info= params[:info]
    @selected_data = params[:data]
    if params[:query].present?
      @search = Book.search(params[:query], page: params[:page])
    else
      @search = Book.all.page params[:page]
    end
  end

  def help
  end

  def contact
  end

  def add
  end
 


private

  def sort_column
      current_user.feed.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end
  
  def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  def book_detail
      client = Openlibrary::Client.new
      client.search(params[:info])
  end
          
end

 