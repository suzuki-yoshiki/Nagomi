class WorkReservationsController < ApplicationController
  
  def index
    @phone_reservation_number = PhoneReservation.where(line_booked: true).where(line_end: false).size  #電話予約件数
    @phone_reservations = PhoneReservation.where(line_booked: true).where(line_end: true) #電話の履歴
    @work_reservations = WorkReservation.where.not(worked_on: nil)
    if
      @users = User.paginate(page: params[:page], per_page: 10)
    else
      User.all
    end
  end

  def new
    @work_reservation = WorkReservation.new
    @main_menus = %w(ー部屋掃除8畳以上 ー部屋掃除6畳以下 レンジフードクリーニング キッチンクリーニング 風呂場 ) #予約項目メインメニュー
    @option_menus = %w(窓ガラス内側のみクリーニング エアコンはフィルターまで行います 洗濯機は洗剤を入れて６０分 電化製品 冷蔵庫クリーニング 電子レンジクリーニング 棚づくり 玄関 トイレ 洗面所 庭 )#オプションメニュー
  end

  def create
   @work_reservation = WorkReservation.new(work_reservation_params)
   @work_reservation.update(beginning_month: params[:work_reservation][:worked_on].to_date.beginning_of_month)
   if @work_reservation.save
       flash[:success] = "予約の新規作成に成功しました。"
      redirect_to work_reservations_url
   else
       flash[:danger] = "未入力の箇所があります。"
       redirect_back(fallback_location: work_reservations_url)
   end
  end

  def edit
    @work_reservation = WorkReservation.find(params[:id])
    @main_menus = %w(ー部屋掃除８畳以上 ー部屋掃除6畳以下 レンジフードクリーニング キッチンクリーニング )
    @option_menus = %w(窓ガラス内側のみクリーニング エアコンはフィルターまで行います 洗濯機は洗剤を入れて６０分 電化製品 冷蔵庫クリーニング 電子レンジクリーニング 棚づくり 玄関 トイレ 洗面所 庭 )#オプションメニュー
  end

  def update
    @work_reservation = WorkReservation.find(params[:id])
      if @work_reservation.update_attributes(update_work_reservation_params)
        @work_reservation.update(beginning_month: params[:work_reservation][:worked_on].to_date.beginning_of_month)
        flash[:success] = "編集しました。"
        redirect_to work_reservations_url
      else
        flash[:danger] = "不正な入力がありました、再入力してください。"
        render :edit
      end
  end

  def destroy
    work_reservation = WorkReservation.find(params[:id])
    work_reservation.destroy
    flash[:success] = "削除しました。"
    redirect_to work_reservations_url
  end

  def work_reservation_number
    @month_requests_counts = WorkReservation.where.not(worked_on: nil).group(:beginning_month).count
    # debugger
    # array = []
    # work_reservations = WorkReservation.all
    # work_reservations.each do |work_reservation|
    #    array.push(work_reservation.worked_on)
    # end
    # debugger
    # hash = array.group_by(&:beginning_of_month)
    # @sample = hash.values


    # reservation_num = []
    # @sample.each do |num|
    #   reservation_num.push(num.count)
    # end
    # @reservation_num = reservation_num
    # debugger
    # reservation_month = []
    # @work_reservations.each do |work_reservation|
    #   work_reservation.worked_on.to_s(:year_month)
    #   reservation_month.push(work_reservation.worked_on.to_s(:year_month))
    # end

    # @reservation_month = reservation_month.uniq
  end

  private

   def work_reservation_params
     params.require(:work_reservation).permit({main_menu: []}, {option_menu: []}, :reservation_work, :worked_on, :start_times, :price, :user_id)
   end

   def update_work_reservation_params
     params.require(:work_reservation).permit({main_menu: []}, {option_menu: []}, :reservation_work, :worked_on, :start_times, :price)
  end
end
