class ModifyChildren < ActiveRecord::Migration
  def self.up
	change_column :children, :birth_cert, :boolean rescue add_column :children, :birth_cert, :boolean
	remove_column :children, :cousins rescue 'Cousins column doesn''t exist'
	remove_column :children, :classroom rescue 'Classroom column doesn''t exist'
	add_column :children, :alt_last, :string
  end

  def self.down
	add_column :children, :cousins, :integer
	add_column :children, :classroom, :string
	remove_column :children, :alt_last
	remove_column :children, :birth_cert rescue puts 'Birth_cert already removed from Children'
  end
end
