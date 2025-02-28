class Mission < ApplicationRecord
  belongs_to :user
  belongs_to :inventory
  has_many :mission:lobby_levels
  has_many :levels, through: :lobby_levels
end
