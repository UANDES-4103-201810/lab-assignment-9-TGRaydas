class PersonsController < ApplicationController
  def index
    who_want = params[:q]
    @new = false
    @the_show = nil
    @persons = nil
    if who_want == nil
      @new = true
      return true
    elsif who_want == "actor"
      @the_show = "Actor"
      @persons = Actor.all
    elsif who_want == "director"
      @the_show = "Director"
      @persons = Director.all
    end
  end
  def create
    all_params = params
    name = params[:name]
    last_name = params[:last_name]
    bd = Date.parse(params[:bd])
    actor = params[:actor]
    director = params[:director]
    description = params[:des]
    if actor == "1"
      Actor.create(first_name:name, last_name: last_name, birth_date: bd, description: description)
      flash[:notice] = "The actor was created"
      redirect_to '/persons?q=actor'

    elsif director == "1"
      Director.create(first_name:name, last_name: last_name, birth_date: bd, description: description)
      flash[:notice] = "The director was created"
      redirect_to '/persons?q=director'
    end
  end
  def new_actor
    actor = JSON.parse params[:actor]
    name = actor["name"]
    last_name = actor["last_name"]
    description = actor["description"]
    birth_date = Date.parse(actor["birth_date"])
    new_actor = Actor.create(first_name:actor["name"], last_name:actor["last_name"],
                             description: actor["description"], birth_date: Date.parse(actor["birth_date"]))
    render :json => new_actor.id
  end
end
