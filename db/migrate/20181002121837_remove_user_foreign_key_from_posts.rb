class RemoveUserForeignKeyFromPosts < ActiveRecord::Migration[5.2]
  def change
  	remove_foreign_key :posts, column: :user_id
  end
end
