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
  end
private
  def user_params
    params.require(:article).permit(:title, :image, :category, :oshi_point)
  end
end
