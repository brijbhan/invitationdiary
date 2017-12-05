class RenameColumnToInvitee < ActiveRecord::Migration[5.0]
  def change
    rename_column :invitees, :user_id, :party_id
  end
end
