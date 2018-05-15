class Movie < ApplicationRecord
  belongs_to :director
  has_many :movie_categories
  has_many :categories, through: :movie_categories
  has_many :actormovies
  has_one :address
  has_many :actors, through: :actormovies
end
