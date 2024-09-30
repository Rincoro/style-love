class ArticlesController < ApplicationController

  skip_before_action :require_login, only: %i[index show]
  def new
    @article = Article.new
  end
 
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      flash[:success] = "投稿に成功しました"
      redirect_to root_path
    else
      flash[:alert] = "投稿に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @article = Article.find(params[:id])
  end


  def index
    @articles = Article.all.includes(:user).order(created_at: :desc)
  end
private
  def article_params
    params.require(:article).permit(:title, :category, :oshi_point, images:[])
  end
end
