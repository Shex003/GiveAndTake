class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :initiator_trades, class_name: 'Trade', foreign_key: 'initiator_id'
  has_many :receiver_trades, class_name: 'Trade', foreign_key: 'receiver_id'

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true, uniqueness: true
  validates :last_name, presence: true, uniqueness: true
  # validates :profile_picture, presence: true

  # validates :movie, uniqueness: { scope: :list } #added by AAG as reminder
end
