class PlanetsController < ApplicationController
  def index
    @planets = Planet.all
  end


  def new
  end

  def create
    planet = Planet.new
    planet.name = params[:name]
    planet.image = params[:image]
    planet.orbit = params[:orbit]
    planet.diameter = params[:diameter]
    planet.mass = params[:mass]
    planet.moons = params[:moons]
    planet.save

    redirect_to planets_path
  end

  def show
    @planet = Planet.find params[:id]

  end

  def edit
    @planet = Planet.find params[:id]

  end

  def update
    planet = Planet.find params[:id]
    planet.update :name => params[:name], :image => params[:image], :orbit => params[:orbit]
    redirect_to planet_path(planet.id)
  end

  def destroy
    planet = Planet.find params[:id]
    planet.destroy
    redirect_to planets_path
  end

end
