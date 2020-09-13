class ToolsController < ApplicationController
  def index
    @tools = Tool.all
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      redirect_to tools_url
      flash[:success] = "新規登録に成功しました。"
    else
      render :new
    end
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update_attributes(tool_params)
      flash[:success] = "道具情報を更新しました。"
      redirect_to tools_url
    else
      render :edit      
    end
  end

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    flash[:danger] = "#{@tool.tool_name}のデータを削除しました。"
    redirect_to tools_url
  end

  private

    def tool_params
      params.require(:tool).permit(:tool_name, :price, :tool_count, :tool_explanation, :image)
    end
  
end
