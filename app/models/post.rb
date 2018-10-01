class Post < ApplicationRecord
  belongs_to :topic
  has_many :photos, dependent: :destroy
end
