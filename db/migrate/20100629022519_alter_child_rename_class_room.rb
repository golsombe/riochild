class AlterChildRenameClassRoom < ActiveRecord::Migration
  def self.up
	rename_column :children, :class_room, :classroom
  end

  def self.down
	rename_column :children, :classroom, :class_room
  end
end
