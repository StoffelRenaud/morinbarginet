class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :content
      t.integer :owner_id

      t.timestamps
    end

    add_foreign_key :answers, :users, column: :owner_id
    add_index :answers, :owner_id
  end
end
