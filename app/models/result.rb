class Result < ApplicationRecord
  validates :game, presence: true
  validates :score1, presence: true
  validates :score2, presence: true
  validates :point1, presence: true
  validates :point2, presence: true
end
