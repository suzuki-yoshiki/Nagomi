class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def new
  end

  def show
  end

  def create
    @work = Work.new(
      profile_image_id: params[:profile_image_id],
      content_name: params[:content_name],
      content: params[:content],
      content_price: params[:content_price]
    )
   if @work.save
       flash[:success] = "作業の新規作成に成功しました。"
      redirect_to works_path
   else
       flash[:danger] = "不正な入力がありました、再入力してください。"
      redirect_to works_path
   end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    if @work.update_attributes(update_work_params)
     flash[:success] = "編集しました。"
     redirect_to works_path
    else
      flash[:danger] = "不正な入力がありました、再入力してください。"
      redirect_to works_path
    end
  end

  def destroy
    work = Work.find(params[:id])
    work.delete
    flash[:success] = "削除しました。"

    redirect_to works_path
  end

  def user_index
    
  end

  private

    def update_work_params
      params.require(:work).permit(:profile_image_id, :content_name, :content, :content_price)
    end

end
