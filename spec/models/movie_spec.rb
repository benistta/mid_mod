require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :movie_actors }
    it { should have_many(:actors).through :movie_actors }
  end

  describe '' do
    it 'actors average age ' do
      studio = Studio.create(name: "Universal Studios", location: "Hollywood")
      movie_1 = studio.movies.create(title: "Raiders of the lost ark", creation_year: 1981, genre: "Action")
      movie_2 = studio.movies.create(title: "Pride and Perjudice", creation_year: 2000, genre: "Romance")

      ford = Actor.create(name: 'Harrison Ford', age: 78)
      kilmer = Actor.create(name: 'Val Kilmer', age: 68)
      reeves = Actor.create(name: 'Keanu Reeves', age: 58)

      MovieActor.create(movie_id: movie_1.id, actor_id: ford.id)
      MovieActor.create(movie_id: movie_1.id, actor_id: kilmer.id)
      MovieActor.create(movie_id: movie_2.id, actor_id: reeves.id)

      expect(movie_1.actor_average_age).to eq(73)
    end
  end
end
