class CreateFamilyImages < ActiveRecord::Migration
  def self.up
    create_table :family_images do |t|
      t.integer :family_id
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :family_images
  end
end
