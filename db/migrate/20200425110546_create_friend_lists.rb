class CreateFriendLists < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_lists do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end

    create_table :user_friend_lists do |t|
      t.references :friend_list
      t.references :user
    end
  end
end
