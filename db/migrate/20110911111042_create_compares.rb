class CreateCompares < ActiveRecord::Migration
  def self.up
    create_table :compares do |t|
      t.integer :chapter_id
      t.integer :page_number_relative

      t.timestamps
    end
  end

  def self.down
    drop_table :compares
  end
end
