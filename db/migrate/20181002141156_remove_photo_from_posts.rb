class RemovePhotoFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :posts, :photo, foreign_key: true
  end
end
