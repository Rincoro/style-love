class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = current_user.comments.build(comment_params)
    @comment.article_id = @article.id
    @comment.save
    if @comment.save
      flash[:success] = "コメントしました"
    else
      flash[:alert] = "コメントに失敗しました"
      redirect_to article_path(@article.id), status: :unprocessable_entity
    end
  end

  def edit
    @comment = current_user.comments.find(params[:id])
    respond_to do |format|
      format.html { render "comments/form_edit", locals: { comment: @comment } } 
    end
  end
 
  def update
    @comment = current_user.comments.find(params[:id])
    if @comment.update(comment_params)
      respond_to do |format|
        format.turbo_stream # Turbo Streamレスポンスを返す
      end
    else
      flash[:alert] = "更新に失敗しました"
      redirect_to article_path(@comment.article_id), status: :unprocessable_entity
    end
  end


  def destroy
    @comment = current_user.comments.find(params[:id])
    if @comment.destroy
      respond_to do |format|
        format.turbo_stream
      end
    else
      flash[:alert] = "削除に失敗しました"
      redirect_to article_path(@comment.article_id), status: :unprocessable_entity
    end
  end
 

  private
    def comment_params
      params.require(:comment).permit(:body, :article_id)
    end
end