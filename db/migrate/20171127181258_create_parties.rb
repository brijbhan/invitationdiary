class CreateParties < ActiveRecord::Migration[5.0]
  def change
    create_table :parties do |t|
      t.integer :user_id, index: true
      t.date :start_at
      t.date :end_at
      t.text :venue
      t.boolean :is_active, default: true
      
      t.timestamps
    end

    add_index :parties, :venue
  end
end
