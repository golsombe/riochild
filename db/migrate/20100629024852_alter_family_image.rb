class AlterFamilyImage < ActiveRecord::Migration
  def self.up
	add_column :family_images, :photograph_primary, :tinyint
  end

  def self.down
	remove_column :family_images, :photograph_primary
  end
end
