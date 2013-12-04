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
  	@data_types = %w[isbn title author]
  	client = Openlibrary::Client.new
  	
  	
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
  		data = Openlibrary::Data
  		data.find_by_isbn(params[:info])
	end
  	
end
