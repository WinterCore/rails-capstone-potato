class CommentsController < ApplicationController
  before_action :authenticate

  def create
    @article = Article.find(params[:article_id])
    @comment = current_user.comments.create(comment_params.merge(article_id: @article.id))
    if @comment.save
      flash[:notice] = 'Your comment has been stored successfully.'
      redirect_to article_path(@article)
    else
      render 'articles/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
