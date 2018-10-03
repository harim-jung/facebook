class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: { unique: true }, foreign_key: true, null: false #removed index (uniqueness) & foreign_key
      t.belongs_to :board, index: { unique: true }, foreign_key: true, null: false  #removed index (uniqueness) & foreign_key
      t.timestamps
    end
  end
end
