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
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @bookings = current_user.bookings
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date, :pickup_location, :insurance, :comment, :car_id, :user_id)
  end
end
