class AddLangIdToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :lang_id, :integer
  end

  def self.down
    remove_column :pages, :lang_id
  end
end
