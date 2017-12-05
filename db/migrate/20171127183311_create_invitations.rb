class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.integer :party_id, index: true
      t.text :message

      t.timestamps
    end
  end
end
