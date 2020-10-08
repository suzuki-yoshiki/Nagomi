class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def show
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to works_url
      flash[:success] = "新規登録に成功しました。"
    else
      render :new
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    if @work.update_attributes(work_params)
     flash[:success] = "作業内容を編集しました。"
     redirect_to works_url
    else
      flash[:danger] = "必須項目を埋めて下さい。"
      render :edit
    end
  end

  def destroy
    work = Work.find(params[:id])
    work.delete
    flash[:success] = "削除しました。"
    redirect_to works_url
  end

  def user_index
  end

  def user_show_room
  end

  def user_show_kitchen
  end

  def user_show_water
  end

  def user_show_outside
  end

  private

    def work_params
      params.require(:work).permit(:profile_image, :content_name, :content, :content_price)
    end

end
