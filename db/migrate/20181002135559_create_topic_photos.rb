class CreateTopicPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :topic_photos do |t|
      t.string :url
      t.references :topic, foreign_key: true

      t.timestamps
    end

  end
end
