class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @car = Car.find(params[:car_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @car = Car.find(params[:car_id])
    @car.update(status: "busy")
    @booking.car = @car
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def index
    @bookings = Booking.all
  end

  def show
     @booking = Booking.find(params[:car_id])
  end

  private

  def booking_params
    params.require(:booking).permit( :start_date, :end_date, :pickup_location, :insurance)
  end
end
