class Plate < ActiveRecord::Base

	belongs_to :user

	has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "300x300>" }, :default_url => "/images/:style/missing.png"


	validates :image, presence: true
  	validates :description, presence: true
  	validates :recipe, presence: true
end
