class CreateInvitees < ActiveRecord::Migration[5.0]
  def change
    create_table :invitees do |t|
    	t.integer :user_id, index: true
    	t.string :name
    	t.string :mobile
    	t.string :street
    	t.string :city
    	t.string :state
    	t.boolean :is_invited, default: false
    	t.integer :call_count, default: 0
      t.timestamps
    end
  end
end
