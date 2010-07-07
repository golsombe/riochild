class AlterChildImage < ActiveRecord::Migration
  def self.up
	add_column :child_images,  :photograph_primary,  :tinyint 
  end

  def self.down
	remove_column :child_images, :photograph_primary
  end
end
