class ReviewsController < ApplicationController
  def index
    @reviews = Review.order(created_at: :desc)
  end

  def new 
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to reviews_path(@review)
      flash[:success] = "新規投稿を作成しました。"
    else
      flash.now[:danger] = "投稿内容は150文字以内で入力して下さい"
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to reviews_path(@review)
      flash[:success] = "投稿を更新しました。"
    else
      redirect_to edit_review_path(@review)
      flash[:danger] = "投稿内容は150文字以内で入力して下さい"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path(@review)
    flash[:danger] = "投稿を削除しました。"
  end

  private

  def review_params
    params.require(:review).permit(:score, :content, :image, :rate, :name, :email)
  end
  
end
