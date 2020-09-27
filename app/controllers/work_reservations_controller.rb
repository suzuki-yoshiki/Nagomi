class WorkReservationsController < ApplicationController
  def index
      @users = User.all
  end

  def new
    @work_reservation = WorkReservation.new
  end

  def show
    @phone_reservation_number = 0  #電話予約が確定してないので仮の0
    @work_reservations = WorkReservation.where.not(worked_on: nil)
  end

  def create
    @work_reservation = WorkReservation.new(work_reservation_params)

   if @work_reservation.save!
       flash[:success] = "予約の新規作成に成功しました。"
      redirect_to work_reservation_path(current_user)
   else
       flash[:danger] = "不正な入力がありました、再入力してください。"
      redirect_to work_reservation_path(current_user)
   end

  end

  def edit
    @work_reservation = WorkReservation.find(params[:id])
  end

  def update
    @work_reservation = WorkReservation.find(params[:id])

      if @work_reservation.update_attributes(update_work_reservation_params)

       flash[:success] = "編集しました。"

      end
      redirect_to work_reservation_path
  end

  def destroy
    work_reservation = WorkReservation.find(params[:id])
    work_reservation.destroy
    flash[:success] = "削除しました。"

    redirect_to work_reservation_path

  end

  private

   def work_reservation_params
     params.require(:work_reservation).permit(:reservation_work, :worked_on, :user_id)
   end

   def update_work_reservation_params
     params.require(:work_reservation).permit(:reservation_work, :worked_on)
   end
end
