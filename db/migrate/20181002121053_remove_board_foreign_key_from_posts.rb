class RemoveBoardForeignKeyFromPosts < ActiveRecord::Migration[5.2]
  def change
  	remove_foreign_key :posts, column: :board_id
  end
end
