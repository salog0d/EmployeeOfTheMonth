class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :missions
  has_many :user_leaderboards
  has_many :leaderboard, through: :user_leaderboards
  has_many :reward_users
  has_many :rewards, through: :reward_users
end
