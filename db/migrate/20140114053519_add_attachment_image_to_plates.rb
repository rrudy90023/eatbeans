class AddAttachmentImageToPlates < ActiveRecord::Migration
  def self.up
    change_table :plates do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :plates, :image
  end
end
