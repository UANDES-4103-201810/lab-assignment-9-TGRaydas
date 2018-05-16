class MoviesController < ApplicationController
  def index

  end
  def new
    @movie = Movie.new
    @all_directors = []
    Director.all.each do |dir|
      director = [dir.first_name + " " +dir.last_name, dir.id]
      @all_directors.push(director)
    end
    @all_actors = []
    Actor.all.each do |dir|
      actor = [dir.first_name + " " +dir.last_name, dir.id]
      @all_actors.push(actor)
    end
  end
  def create
    title = params[:movie][:title]
    description = params[:movie][:description]
    duration = params[:movie][:duration]
    release = DateTime.parse(params[:movie][:release_date])
    director = params[:movie][:director_id]
    street = params[:street]
    apartment = params[:apartment]
    address_des = params[:description]
    zipcode = params[:zipcode]
    movie = Movie.create(title:title, description:description, duration:duration, director_id:director,
                         release_date:release)
    actors = params[:actors]
    actors.each do |act|
      Actormovie.create(actor_id: act, movie_id: movie.id)
    end
    address = Address.create(street:street, apartment:apartment, description:address_des, zipcode:zipcode, movie_id:movie.id)
  end
end
