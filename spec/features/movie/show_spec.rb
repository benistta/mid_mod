require 'rails_helper'

RSpec.describe 'Movie show page' do
  it 'can see the movie attributes, and a list of all its actors.' do

    studio = Studio.create(name: "Universal Studios", location: "Hollywood")
    movie_1 = studio.movies.create(title: "Raiders of the lost ark", creation_year: 1981, genre: "Action")
    movie_2 = studio.movies.create(title: "Pride and Perjudice", creation_year: 2000, genre: "Romance")

    ford = Actor.create(name: 'Harrison Ford', age: 78)
    kilmer = Actor.create(name: 'Val Kilmer', age: 68)
    reeves = Actor.create(name: 'Keanu Reeves', age: 58)

    MovieActor.create(movie_id: movie_1.id, actor_id: ford.id)
    MovieActor.create(movie_id: movie_1.id, actor_id: kilmer.id)
    MovieActor.create(movie_id: movie_2.id, actor_id: reeves.id)

    visit "/movies/#{movie_1.id}"

    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_1.creation_year)
    expect(page).to have_content(movie_1.genre)

end
    it 'can list of all its actors by age.' do

      studio = Studio.create(name: "Universal Studios", location: "Hollywood")
      movie_1 = studio.movies.create(title: "Raiders of the lost ark", creation_year: 1981, genre: "Action")
      # movie_2 = studio.movies.create(title: "Pride and Perjudice", creation_year: 2000, genre: "Romance")

      ford = Actor.create(name: 'Harrison Ford', age: 78)
      kilmer = Actor.create(name: 'Val Kilmer', age: 68)
      # reeves = Actor.create(name: 'Keanu Reeves', age: 58)

      MovieActor.create(movie_id: movie_1.id, actor_id: ford.id)
      MovieActor.create(movie_id: movie_1.id, actor_id: kilmer.id)
      # MovieActor.create(movie_id: movie_2.id, actor_id: reeves.id)

      visit "/movies/#{movie_1.id}"

      expect(page).to have_content(kilmer.name)
      expect(page).to have_content(ford.name)


  end

  it 'can see average age of all movie actors.' do

    studio = Studio.create(name: "Universal Studios", location: "Hollywood")
    movie_1 = studio.movies.create(title: "Raiders of the lost ark", creation_year: 1981, genre: "Action")

    ford = Actor.create(name: 'Harrison Ford', age: 78)
    kilmer = Actor.create(name: 'Val Kilmer', age: 68)

    MovieActor.create(movie_id: movie_1.id, actor_id: ford.id)
    MovieActor.create(movie_id: movie_1.id, actor_id: kilmer.id)

    visit "/movies/#{movie_1.id}"

    expect(page).to have_content("Average age: #{movie_1.actor_average_age}")
    save_and_open_page
  end

  it 'can see a form to add actors to this movie.' do

    studio = Studio.create(name: "Universal Studios", location: "Hollywood")
    movie_1 = studio.movies.create(title: "Raiders of the lost ark", creation_year: 1981, genre: "Action")
    movie_2 = studio.movies.create(title: "Pride and Perjudice", creation_year: 2000, genre: "Romance")

    ford = Actor.create(name: 'Harrison Ford', age: 78)
    kilmer = Actor.create(name: 'Val Kilmer', age: 68)
    reeves = Actor.create(name: 'Keanu Reeves', age: 58)

    MovieActor.create(movie_id: movie_1.id, actor_id: ford.id)
    MovieActor.create(movie_id: movie_1.id, actor_id: kilmer.id)
    MovieActor.create(movie_id: movie_2.id, actor_id: reeves.id)

    visit "/movies/#{movie_1.id}"

    expect(page).to_not have_content(reeves.name)
    # click_button 'Add Actor'

    fill_in 'name', with: 'Sandra Bullock'
    # fill_in 'age', with: '34'
    click_button 'Submit'

    expect(current_path).to eq("/movies/#{movie_1.id}")
    expect(page).to have_content('Sandra Bullock')
    # expect(page).to have_content(34)


end
end
