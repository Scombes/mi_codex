class Book < ActiveRecord::Base
	searchkick
	belongs_to :user
	
	validates :user_id, presence: true
	validates :title, presence: true, length: { maximum: 100 }
	

end 
