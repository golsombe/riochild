class CreateFamilyChildren < ActiveRecord::Migration
  def self.up
    create_table :family_children do |t|
      t.integer :family_id
      t.integer :child_id
      t.date :update_dt

      t.timestamps
    end
  end

  def self.down
    drop_table :family_children
  end
end
