class CreateFamilies < ActiveRecord::Migration
  def self.up
    create_table :families do |t|
      t.string :name
      t.tinyint :sponsored
      t.date :sponsor_being
      t.date :sponsor_expire

      t.timestamps
    end
  end

  def self.down
    drop_table :families
  end
end
