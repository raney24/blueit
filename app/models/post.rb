class Post < ActiveRecord::Base
	belongs_to :user
	acts_as_votable
	has_many :comments

	validates :title, :description, presence: true

	searchable do
		text :title, boost: 5.0
		text :description
	end
end
