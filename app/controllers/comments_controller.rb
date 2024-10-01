class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = current_user.comments.build(comment_params)
    @comment.article_id = @article.id
    @comment.save
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_to article_path(@article.id)
    else
      flash[:alert] = "コメントに失敗しました"
      redirect_to article_path(@article.id), status: :unprocessable_entity
    end
  end

  def edit
    @comment = current_user.comments.find(params[:id])
  end
 
  def update
    @article = Article.find(params[article_id])
    @comment = current_user.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = "コメントの編集に成功しました"
      redirect_to articles_path
    else
      flash[:alert] = "コメントの編集に失敗しました"
      redirect_to article_path(@article.id), status: :unprocessable_entity
    end
  end


  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
  end
 

  private
    def comment_params
      params.require(:comment).permit(:body, :article_id)
    end
end
