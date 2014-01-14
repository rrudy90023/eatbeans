class Plate < ActiveRecord::Base

	belongs_to :user

	has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "300x300>" }, :default_url => "/images/:style/missing.png"

end
