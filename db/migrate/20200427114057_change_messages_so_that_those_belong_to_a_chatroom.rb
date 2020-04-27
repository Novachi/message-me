class ChangeMessagesSoThatThoseBelongToAChatroom < ActiveRecord::Migration[5.2]
  def change
    change_table :messages do |t|
      t.references :chatroom
    end
  end
end
