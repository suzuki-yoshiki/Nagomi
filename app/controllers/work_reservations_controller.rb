class WorkReservationsController < ApplicationController
  def index
  end

  def new
  end

  def show
    @phone_reservations = PhoneReservation.all
  end

  def edit
  end

  def update
  end

  def create
  end
end
