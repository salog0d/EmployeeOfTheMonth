class UserLeaderboard < ApplicationRecord
  belongs_to :user
  belongs_to :leaderboard
end
