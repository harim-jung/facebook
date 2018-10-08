class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
		t.string :content
		t.belongs_to :post, index: true, foreign_key: true, null: false
		t.belongs_to :user, index: true, foreign_key: true, null: false
      t.timestamps
    end
  end
end
