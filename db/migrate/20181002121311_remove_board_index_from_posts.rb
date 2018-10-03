class RemoveBoardIndexFromPosts < ActiveRecord::Migration[5.2]
  def change
  	remove_index :posts, column: :board_id
  end
end
