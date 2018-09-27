class AddParentAndNameAndAdminAndTelephoneAndPhotoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :parent, :string
    add_column :users, :name, :string
    add_column :users, :admin, :string, :default => false
    add_column :users, :telephone, :string
    add_column :users, :photo, :string
  end
end
