class CreateChildUpdates < ActiveRecord::Migration
  def self.up
    create_table :child_updates do |t|
      t.integer :child_id
      t.text :notes
      t.date :update_dt

      t.timestamps
    end
  end

  def self.down
    drop_table :child_updates
  end
end
