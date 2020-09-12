class PhoneReservationsController < ApplicationController
  before_action :set_two_weeks,only: [:index, :edit]
  before_action :set_day_time,only: [:index, :edit]

  def index
    @phone_reservation = PhoneReservation.all
    # @phone_reservation = PhoneReservation.find(params[:id])
  end

  def new
  end

  def show
  end

  def edit
    @phone_reservation = PhoneReservation.find(params[:id])
  end

  def update
  end

  def create
  end

end
