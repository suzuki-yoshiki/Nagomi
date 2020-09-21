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
    array = []  #予約状況の件数を配列に入れて表示させようとしてますが上手くいかず未完成の状態です。
    work = WorkReservation.group(:worked_on).count(:worked_on)
    array << work
    @array = array
  end

  def create
    @work_reservation = WorkReservation.new(
      user_id: current_user.id,
      reservation_work: params[:reservation_work],
      worked_on: params[:worked_on],
    )
   if @work_reservation.save
       flash[:success] = "予約の新規作成に成功しました。"
      redirect_to work_reservation_path(@current_user)
   else
       flash[:danger] = "不正な入力がありました、再入力してください。"
      redirect_to work_reservation_path(@current_user)
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

   def update_work_reservation_params
     params.require(:work_reservation).permit(:reservation_work, :worked_on)
   end
end
