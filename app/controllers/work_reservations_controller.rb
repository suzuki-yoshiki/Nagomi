class WorkReservationsController < ApplicationController
  def index
    if 
      @users = User.paginate(page: params[:page], per_page: 10)
    else
      User.all
    end
  end

  def new
    @work_reservation = WorkReservation.new
  end

  def show
    @phone_reservation_number = PhoneReservation.where(line_booked: true).where(line_end: false).size  #電話予約が確定してないので仮の0
    @work_reservations = WorkReservation.where.not(worked_on: nil)
  end

  def create
   @work_reservation = WorkReservation.new(work_reservation_params)
   if @work_reservation.save!
       flash[:success] = "予約の新規作成に成功しました。"
      redirect_to work_reservation_url(current_staff)
   else
       flash[:danger] = "不正な入力がありました、再入力してください。"
       render :new
   end
  end

  def edit
    @work_reservation = WorkReservation.find(params[:id])
    @main_menus = %w(ー部屋掃除８畳以上 ー部屋掃除6畳以下 レンジフードクリーニング キッチンクリーニング )
    @option_menus = %w(窓ガラス内側のみクリーニング エアコンはフィルターまでやる 洗濯機は洗剤を入れて１日おく 電化製品 棚づくり 玄関 トイレ 洗面所 庭 )
  end

  def update
    @work_reservation = WorkReservation.find(params[:id])
      if @work_reservation.update_attributes(update_work_reservation_params)
       flash[:success] = "編集しました。"
       redirect_to work_reservation_path
      else
        flash[:danger] = "不正な入力がありました、再入力してください。"
        render :edit
      end
  end

  def destroy
    work_reservation = WorkReservation.find(params[:id])
    work_reservation.destroy
    flash[:success] = "削除しました。"
    redirect_to work_reservation_path
  end

  private

   def work_reservation_params
     params.require(:work_reservation).permit({main_menu: []}, {option_menu: []}, :reservation_work, :worked_on, :start_times, :user_id)
   end

   def update_work_reservation_params
     params.require(:work_reservation).permit({main_menu: []}, {option_menu: []}, :reservation_work, :worked_on, :start_times)
  end
end
