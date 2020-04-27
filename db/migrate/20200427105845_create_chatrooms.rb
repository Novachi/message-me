class CreateChatrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chatrooms do |t|
      t.timestamps
    end

    create_table :chatrooms_users do |t|
      t.references :user
      t.references :chatroom
    end
  end
end
