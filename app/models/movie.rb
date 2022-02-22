class Movie < ApplicationRecord
  belongs_to :studio

  has_many :movie_actors
  has_many :actors, through: :movie_actors

  # def self.by_age
  #   order(age: :asc)
  # end

  def actor_average_age
  actors.average(:age).to_f
  end
end
