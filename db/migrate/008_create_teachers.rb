class CreateTeachers < ActiveRecord::Migration
  def self.up
    create_table :teachers do |t|
      t.string :first
      t.string :last
      t.string :gender
      t.string :village
      t.integer :grade
      t.string :school

      t.timestamps
    end
  end

  def self.down
    drop_table :teachers
  end
end
