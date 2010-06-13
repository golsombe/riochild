class AddAttachmentsPhotographToFamilyImage < ActiveRecord::Migration
  def self.up
    add_column :family_images, :photograph_file_name, :string
    add_column :family_images, :photograph_content_type, :string
    add_column :family_images, :photograph_file_size, :integer
    add_column :family_images, :photograph_updated_at, :datetime
  end

  def self.down
    remove_column :family_images, :photograph_file_name
    remove_column :family_images, :photograph_content_type
    remove_column :family_images, :photograph_file_size
    remove_column :family_images, :photograph_updated_at
  end
end
