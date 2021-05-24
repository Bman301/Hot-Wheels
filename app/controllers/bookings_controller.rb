class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @car = Car.find(params[:car_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @car = Car.find(params[:car_id])
    @booking.car = @car
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end
end

 private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date, :pickup_location, :insurance, :comment, :car_id, :user_id)
  end
