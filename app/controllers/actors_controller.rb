class ActorsController < ApplicationController

  # def update
  #   actor = Actor.find(params[:id])
  #   require "pry"; binding.pry
  #   actor.update(actors_params)
  #   redirect_to "/movies/#{movie_1.id}"
  # end
  #

  def create
    @actor = Actor.create(actor_params)
  end

private
  def actors_params
    params.permit(:name, :age)
  end
end
