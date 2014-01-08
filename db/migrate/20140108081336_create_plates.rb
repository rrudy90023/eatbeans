class CreatePlates < ActiveRecord::Migration
  def change
    create_table :plates do |t|
      t.string :description
      t.string :recipe

      t.timestamps
    end
  end
end
