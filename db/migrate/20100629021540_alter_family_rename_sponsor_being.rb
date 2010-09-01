class AlterFamilyRenameSponsorBeing < ActiveRecord::Migration
  def self.up
	rename_column :families, :sponsor_being, :sponsor_begin
  end

  def self.down
	rename_column :families, :sponsor_begin, :sponsor_being
  end
end
