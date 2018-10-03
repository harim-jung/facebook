class AddForeignKeyToPosts < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :posts, :users
    add_foreign_key :posts, :boards
  end
end
