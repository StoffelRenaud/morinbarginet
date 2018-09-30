class Reservation < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :answers, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
end
