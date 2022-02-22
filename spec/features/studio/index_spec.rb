require 'rails_helper'

RSpec.describe 'Studio Index page' do

  it 'can see studios name and location  with titles of movies' do
    studio = Studio.create(name: "Universal Studios", location: "Hollywood")
    movie_1 = studio.movies.create(title: "Raiders of the lost ark", creation_year: 1981, genre: "Action")
    movie_2 = studio.movies.create(title: "Pride and Perjudice", creation_year: 2000, genre: "Romance")

    ford = Actor.create(name: 'Harrison Ford', age: 78)
    kilmer = Actor.create(name: 'Val Kilmer', age: 68)
    reeves = Actor.create(name: 'Keanu Reeves', age: 58)

    MovieActor.create(movie_id: movie_1.id, actor_id: ford.id)
    MovieActor.create(movie_id: movie_1.id, actor_id: kilmer.id)
    MovieActor.create(movie_id: movie_2.id, actor_id: reeves.id)

    visit '/studios'

    expect(page).to have_content(studio.name)
    expect(page).to have_content(studio.location)

    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_2.title)

  end
end
