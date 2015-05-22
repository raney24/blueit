class Post < ActiveRecord::Base
	belongs_to :user
	acts_as_votable
	has_many :comments

	validates :title, :description, presence: true

	searchable do
		text :title, boost: 5.0
		text :description
	end

	has_attached_file :image, 
					:styles => { :medium => "300x300>", :thumb => "100x100>", :icon => "32x32>" }, 
					:default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
