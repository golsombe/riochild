class CreateChildren < ActiveRecord::Migration
  def self.up
    create_table :children do |t|
      t.string :first, :last, :middle, :gender, :class_room, :village, :teacher,:sponsor_code, :father, :mother, :lives_with
      t.string :academic, :attendance, :does_homework, :favorite_season
      t.integer :age, :grade, :sisters, :brothers, :cousins
      t.tinyint :birth_cert 
      t.date :birthdate, :sponsor_being, :sponsor_expire
      t.text :occupation, :helps_with, :activities, :favorite_bibleverse

      t.timestamps
    end
  end

  def self.down
    drop_table :children
  end
end
