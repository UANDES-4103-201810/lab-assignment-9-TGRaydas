class MoviesController < ApplicationController
  def index

  end
  def new
    @all_directors = []
    Director.all.each do |dir|
      director = [dir.first_name + " " +dir.last_name, dir.id]
      @all_directors.push(director)
    end
  end
  def create
    title = params[:title]
    description = params[:description]
    duration = params[:duration]
    release = DateTime.parse(params[:release])
    director = params[:director]
    street = params[:street]
    apartment = params[:apartment]
    address_des = params[:add_des]
    zipcode = params[:zipcode]
    address = Address.create(street:street, apartment:apartment, description:address_des, zipcode:zipcode)
    movie = Movie.create(title:title, description:description, duration:duration, director_id:director,
                         release_date:release, address_id:address.id)
  end
end
