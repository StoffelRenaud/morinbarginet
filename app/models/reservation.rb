class Reservation < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :answers, dependent: :destroy
end
