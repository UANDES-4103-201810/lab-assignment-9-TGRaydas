class Actor < ApplicationRecord
  has_many :actormovies
  has_many :movies ,through: :actormovies
end
