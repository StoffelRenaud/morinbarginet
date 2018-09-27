class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :title
      t.integer :owner_id
      t.integer :post_id

      t.timestamps
    end

    add_foreign_key :topics, :users, column: :owner_id
    add_index :topics, :owner_id

    add_foreign_key :topics, :posts, column: :post_id
    add_index :topics, :post_id
  end
end
