class UsersController < ApplicationController
  before_action :set_current_user, only: [:index]
  before_action :correct_user, only: [:show_account]
  protect_from_forgery except: :new_work_reservation


  def index
    if
      @users = User.paginate(page: params[:page], per_page: 10)
    else
      User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to users_url
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end

  def edit_reservation_status
    @day = Date.parse.strftime(params[:day])
    @work_reservations = WorkReservation.where.not(worked_on: nil).where(worked_on: @day).order("start_times ASC")
    @users = User.where(admin: false)
    @staffs = Staff.all
  end
  #メール内容確認ページ
  def reservation_confirmed
    @work_reservation = WorkReservation.find(params[:id])
  end

  def reservation_confirmed_mail
    @work_reservation = WorkReservation.find(params[:id])
     respond_to do |format|
      if @work_reservation.update_attributes(finished_mail_params)
        UserMailer.welcome_email(@work_reservation).deliver
        format.html { redirect_to "/work_reservations", notice: 'お客様に予約内容を送信しました。' }
        format.text { redirect_to "/work_reservations", notice: 'お客様に予約内容を送信しました。' }
        flash[:success] = "お客様に予約内容を送信しました。"

        WorkHistory.create(
          worked_on: @work_reservation.worked_on,
          reservation_work: @work_reservation.reservation_work,
          main_menu: @work_reservation.main_menu,
          option_menu: @work_reservation.option_menu,
          start_times: @work_reservation.start_times,
          price: @work_reservation.price,
          user_id: @work_reservation.user_id,
        )
      else
        format.html { render action: 'new' }
      end
     end
  end

  def new_work_reservation
    @users =
    if params[:search]
      User.paginate(page: params[:page], per_page: 10).search(params[:search])
    else
      User.all.paginate(page: params[:page], per_page: 10)
    end
  end

  def new_index_work_reservation
    @user = User.find(params[:id])
    @main_menus = %w(ー部屋掃除8畳以上 ー部屋掃除6畳以下 レンジフードクリーニング キッチンクリーニング 風呂場 )
    @option_menus = %w(窓ガラス内側のみクリーニング エアコンはフィルターまで行います 洗濯機は洗剤を入れて６０分 電化製品 冷蔵庫クリーニング 電子レンジクリーニング 棚づくり 玄関 トイレ 洗面所 庭 )
  end

  def show_account
    @user = User.find(params[:id])
  end

  def work_reservation_number
    @work_reservations = WorkReservation.where.not(worked_on: nil)

    array = []
    work_reservations = WorkReservation.all
    work_reservations.each do |work_reservation|
       array.push(work_reservation.worked_on)
    end

    hash = array.group_by(&:beginning_of_month)
    @sample = hash.values

    reservation_num = []
    @sample.each do |num|
      reservation_num.push(num.count)
    end
    @reservation_num = reservation_num

    reservation_month = []
    @work_reservations.each do |work_reservation|
      work_reservation.worked_on.to_s(:year_month)
      reservation_month.push(work_reservation.worked_on.to_s(:year_month))
    end

    @reservation_month = reservation_month.uniq
  end

    private

      def user_params
        params.require(:user).permit(:name, :kana, :sex, :email, :phone_number, :password, :password_confirmation)
      end

      def finished_mail_params
        params.require(:work_reservation).permit(:reservation_mark)
      end

end
