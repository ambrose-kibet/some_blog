class CommentsController < ApplicationController
  before_action :set_user_and_article

  def index
    @comments = @post.comments
  end

  def show
    @comment = @user.posts.find(params[:id])
  end

  private

  def set_user_and_article
    @user = User.find(params[:user_id])
    @post = @user.articles.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
