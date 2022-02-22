class MoviesController < ApplicationController
  # def index
  #   @movies = Movie.all
  # end
  def show
    @movie = Movie.find(params[:id])

  end

  def update
    # actor = Actor.find(params[:id])
    @movie = Movie.find(params[:id])
    
    @movie.actors << Actor.find(params[:actor_id])
    # actor = @movie.actors.find(params[:id])
    movie.save
    require "pry"; binding.pry
    # actor.update(actors_params)
    redirect_to "/movies/#{movie_1.id}"
  end
  #
  # private
  #   def actors_params
  #       params.permit(:name, :age)
  #   end
end
