class ItemsController < ApplicationController
  skip_before_action :require_login, only: %i[index,show]
  
  def create
    @article = Article.find(params[:id])
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      flash[:success] = "投稿に成功しました"
      redirect_to article_path(@article)
    else
      flash[:alert] = "投稿に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
      if @item.update(article_params)
        flash[:success] = "アイテム編集に成功しました"
        redirect_to articles_path
      else
        flash[:alert] = "アイテム編集しました"
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:success] = "アイテムを削除しました"
      redirect_to articles_path(@article)
    else
      flash[:alert] = "アイテム削除に失敗しました"
      redirect_to article_path(@article), status: :unprocessable_entity
    end
  end
end
