class Lobby < ApplicationRecord
  has_many :lobby_levels
  has_many :levels, through: :lobby_levels
end
