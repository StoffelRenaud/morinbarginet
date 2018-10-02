class Topic < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :posts, dependent: :destroy
  has_many :topic_photos, dependent: :destroy

  validates :title, presence: true
  validates :info, presence: true
end
