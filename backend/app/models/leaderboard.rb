class Leaderboard < ApplicationRecord
  has_many :user_leaderboards
  has_many :users, through: :user_leaderboards
end
