class CreateChildImages < ActiveRecord::Migration
  def self.up
    create_table :child_images do |t|
      t.integer :child_id
      t.text :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :child_images
  end
end
