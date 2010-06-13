class CreateFamilyUpdates < ActiveRecord::Migration
  def self.up
    create_table :family_updates do |t|
      t.integer :family_id
      t.text :notes
      t.date :update_dt

      t.timestamps
    end
  end

  def self.down
    drop_table :family_updates
  end
end
