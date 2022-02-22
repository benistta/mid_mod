# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Actor.destroy_all
Movie.destroy_all
MovieActor.destroy_all
Studio.destroy_all

studio = Studio.create(name: "Universal Studios", location: "Hollywood")
movie_1 = studio.movies.create(title: "Raiders of the lost ark", creation_year: 1981, genre: "Action")
movie_2 = studio.movies.create(title: "Pride and Perjudice", creation_year: 2000, genre: "Romance")

ford = Actor.create(name: 'Harrison Ford', age: 78)
kilmer = Actor.create(name: 'Val Kilmer', age: 68)
reeves = Actor.create(name: 'Keanu Reeves', age: 58)
bullock = Actor.create(name: 'Sandra Bullock', age: 50)

MovieActor.create(movie_id: movie_1.id, actor_id: ford.id)
MovieActor.create(movie_id: movie_1.id, actor_id: kilmer.id)
MovieActor.create(movie_id: movie_2.id, actor_id: reeves.id)
MovieActor.create(movie_id: movie_2.id, actor_id: bullock.id)
