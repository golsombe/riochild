class CreateChildren < ActiveRecord::Migration
  def self.up
    create_table :children do |t|
      t.string :first, :last, :gender, :class_room, :village, :teacher,:sponsor_code
      t.integer :age, :grade
      t.tinyint :sponsored
      t.date :sponsor_being, :sponsor_expire
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :children
  end
end
