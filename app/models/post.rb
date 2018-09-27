class Post < ApplicationRecord
  belongs_to :topics
  has_many :photos, dependent: :destroy
end
