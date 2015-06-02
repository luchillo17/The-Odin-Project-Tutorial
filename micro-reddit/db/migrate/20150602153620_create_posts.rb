class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title, null: false
      t.string :body, null: false

      t.timestamps null: false
    end
    add_index :posts, :title, unique: true
  end
end
