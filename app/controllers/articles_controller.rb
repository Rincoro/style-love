class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
 
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @articles = Article.all.includes(:user).order(created_at: :desc)
  end
private
  def article_params
    params.require(:article).permit(:title, :image, :category, :oshi_point)
  end
end