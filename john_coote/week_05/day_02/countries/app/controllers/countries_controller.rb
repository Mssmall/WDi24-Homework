class CountriesController < ApplicationController

  def index
    @countries = Country.all
  end

  def new
  end

  def create
    country = Country.new
    country.name = params[:name]
    country.population = params[:population]
    country.capital = params[:capital]
    country.cups = params[:cups]
    country.save
    redirect_to root_path
  end


  def show
    @country = Country.find params[:id]
  end

  def edit
    @country = Country.find params[:id]
  end

  def update
    country = Country.find params[:id]
    country.update :name => params[:name], :population => params[:population], :capital => params[:capital], :cups => params[:cups]
    redirect_to country_show_path(country.id)
  end

  def destroy
    country =Country.find params[:id]
    country.destroy
    redirect_to root_path
  end

  def map
    @countries = Country.all
    @big_array =[['Country', 'Cups']]
    @countries.each do |country|
      small_array = [country.name, country.cups]
      @big_array.push(small_array)
    end
  end

end
