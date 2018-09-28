class Answer < ApplicationRecord
  belongs_to :reservation
  belongs_to :owner, class_name: "User"
end
