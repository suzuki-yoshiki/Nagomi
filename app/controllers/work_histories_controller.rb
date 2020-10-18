class WorkHistoriesController < ApplicationController

  def index
    @work_histories = WorkHistory.all.order(worked_on: "ASC")
  end

  def show
    @user = User.find(params[:id])
    @work_histories = @user.work_histories.all.order(worked_on: "ASC")
  end

  def destroy
    work_history = WorkHistory.find(params[:id])
    work_history.destroy
    flash[:success] = "削除しました。"
    redirect_to work_reservation_path
  end
end
