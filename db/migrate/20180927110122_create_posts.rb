class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :photo_id

      t.timestamps
    end

    add_foreign_key :posts, :photos, column: :photo_id
    add_index :posts, :photo_id
  end
end
