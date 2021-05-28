class PagesController < ApplicationController
  def home
    @car = Car.all.sample
    @car2 = Car.all.sample
    @car3 = Car.all.sample
  end
end
