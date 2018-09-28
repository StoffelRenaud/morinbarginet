class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend Enumerize

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations, foreign_key: :owner_id, dependent: :destroy
  has_many :topics, foreign_key: :owner_id, dependent: :destroy

  enumerize :parent, in: ['Claire', 'Pierre', 'Joie', 'Vivette', 'Tzou', 'Dadou', 'Jacques', 'Minouche']
end
