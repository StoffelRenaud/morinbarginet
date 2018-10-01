class AddInfoToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :info, :text
  end
end
