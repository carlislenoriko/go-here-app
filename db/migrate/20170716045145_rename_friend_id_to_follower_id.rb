class RenameFriendIdToFollowerId < ActiveRecord::Migration[5.0]
  def change
    rename_column :friends, :friend_id, :follower_id
  end
end
