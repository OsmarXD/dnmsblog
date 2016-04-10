class Post < ActiveRecord::Base
	belongs_to :user
	has_many :post_comments

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	validates :image, presence: true
	validates :content, presence: true
	validates :title, presence: true
	
	def self.search(search)
	  where("name LIKE ?", "%#{search}%") 
	  where("content LIKE ?", "%#{search}%")
	end
end
