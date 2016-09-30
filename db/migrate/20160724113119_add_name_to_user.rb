class AddNameToUser < ActiveRecord::Migration[5.0]
  def self.up
  	add_column :users, :name, :string, index: true
  end

  def self.down
  	remove_column :users, :name
  end
end
