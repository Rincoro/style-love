class ArticlesController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    @articles = Article.all.includes(:user).order(created_at: :desc).page(params[:page]).per(8)
  end

  def new
    @article = Article.new
    @item = @article.items.new
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
    @comment = @article.comments.build
    @comments = @article.comments.all.includes(:user).order(created_at: :desc)
    @items = @article.items.all.order(created_at: :desc)
  end

  def edit
    @article = Article.find(params[:id])
  end
 
  def update
    @article = Article.find(params[:id])
      if @article.update(article_params)
        flash[:success] = "投稿の編集に成功しました"
        redirect_to articles_path
      else
        flash[:alert] = "投稿の編集に失敗しました"
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:success] = "投稿を削除しました"
      redirect_to articles_path
    else
      flash[:alert] = "削除に失敗しました"
      redirect_to article_path(@article), status: :unprocessable_entity
    end
  end
 

  private
    def article_params
      params.require(:article).permit(:title, :category, :oshi_point, :body, :image,
      items_attributes:[ :id, :name, :item_category, :store_url, :brand, :image, :_destroy])
    end
  end