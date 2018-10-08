class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.belongs_to :user, index: { unique: true }, foreign_key: true, null: false
      t.timestamps
    end
  end
end


