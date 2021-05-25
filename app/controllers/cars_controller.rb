class CarsController < ApplicationController
  before_action :find_id, only: [:edit, :update, :show, :delete]

  def index
    @cars = Car.all
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
  end

  def delete
    # @car.destroy
  end

  private
  def car_params
    params.require(:car).permit(:model, :brand, :year, :location, :title, :price, :description)
  end

  def find_id
    @car = Car.find(:id)
  end


end
