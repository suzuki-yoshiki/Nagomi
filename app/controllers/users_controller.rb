class UsersController < ApplicationController
  protect_from_forgery except: :new_work_reservation


  def index
    @users = User.all
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
    @work_reservations = WorkReservation.where.not(worked_on: nil).where(worked_on: @day)
    @users = User.where(admin: false)
    @staffs = Staff.all
  end
  #メール内容確認ページ
  def reservation_confirmed
    @user = User.find(params[:id])
    @work_reservation = WorkReservation.find(params[:id])
    @user_reservations = WorkReservation.where.not(worked_on: nil).where(worked_on: @day)
    @work_reservation = WorkReservation.where.not(worked_on: nil).where(worked_on: @day)
  end
  #メール送信する処理ですが未だ途中10/3
  def reservation_confirmed_mail
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.work_reservations.update(@work_reservation)
        # 保存後にUserMailerを使ってwelcomeメールを送信
        UserMailer.with(user: @user).welcome_email.deliver_later
        format.html { render work_reservation_url, notice: '#{@user.name}様に予約確定メールを送信しました。' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_work_reservation
    @user = User.find(params[:id])
    @work_reservation = WorkReservation.find_by(params[:id])
    @main_menus = %w(ー部屋掃除8畳以上 ー部屋掃除6畳以下 レンジフードクリーニング キッチンクリーニング 風呂場 )
    @option_menus = %w(窓ガラス内側のみクリーニング エアコンはフィルターまで行います 洗濯機は洗剤を入れて６０分 電化製品 棚づくり 玄関 トイレ 洗面所 庭 )
  end

  def show_account
    @user = User.find(params[:id])
  end

    private

      def user_params
        params.require(:user).permit(:name, :kana, :sex, :email, :phone_number, :password, :password_confirmation)
      end

end
