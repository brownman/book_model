class CreateLines < ActiveRecord::Migration
  def self.up
    create_table :lines do |t|
      t.string :content
      t.integer :page_id
      t.integer :parent_id
      t.integer :pos

      t.timestamps
    end
  end

  def self.down
    drop_table :lines
  end
end
