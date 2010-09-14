class CreateChildTeachers < ActiveRecord::Migration
  def self.up
    create_table :child_teachers do |t|
      t.integer :child_id
      t.integer :teacher_id
      t.date :valid_from
      t.date :valid_until
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :child_teachers
  end
end
