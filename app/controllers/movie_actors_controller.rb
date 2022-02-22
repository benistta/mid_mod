class MovieActorsController < ApplicationController

def update

  @movie = Moviet.find(params[:movie_id])
  @actor = @movie.actors.find(params[:id])
  @actor.update(actor_params)
end

private
  def actor_params
    params.permit(:name, :age)
  end
end
