class Book < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order ('title DESC') }
	validates :user_id, presence: true
	validates :title, presence: true, length: { maximum: 100 }
	validates :author, presence: true
	validates :isbn, presence: true, length: { maximum: 13 }

end
