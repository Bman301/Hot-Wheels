class CarsController < ApplicationController
  before_action :find_id, only: [:edit, :update, :show, :delete]

  def index
    if params[:query].present?
      @cars = Car.search_by_model_and_brand(params[:query])

    else
      @cars = Car.all
    end
    @markers = @cars.geocoded.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude
      }
    end


  end

  def new
    @car =  Car.new
  end

  def create
    @car =  Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    # @car =  Car.update(car_params)
    # if @car.save
    #   redirect_to root_path
    # else
    #   render :edit
    # end
  end

  def show
    @oneCar = Car.find(params[:id])
    @marker = [{ lat: @oneCar.latitude, lng: @oneCar.longitude}]
  end

  def delete
    # @car.destroy
  end

  private
  def car_params
    params.require(:car).permit(:model, :brand, :year, :location, :title, :price, :description, :photo)
  end

  def find_id
    @car = Car.find(params[:id])
  end


end
