class AlterChildRenameSponsorBegin < ActiveRecord::Migration
  def self.up
	rename_column :children, :sponsor_being, :sponsor_begin
  end

  def self.down
	rename_column :children,:sponsor_begin, :sponsor_being
  end
end
