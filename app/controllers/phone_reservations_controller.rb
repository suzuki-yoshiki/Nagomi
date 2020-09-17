class PhoneReservationsController < ApplicationController
  before_action :set_two_weeks, only: :index
  
  def index
  end

  def new
  end

  def show
    day = PhoneReservation.find(params[:id]).worked_on
    @phone_reservation = PhoneReservation.where(worked_on: day , line_time:params[:time])
    debugger
  end

  def edit
  end

  def update
  end

  def create
  end
end
