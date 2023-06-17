class CommentsController < ApplicationController
  before_action :set_user_and_post

  def index
    @comments = @post.comments.includes(:user)
  end

  def show
    @comment = @post.comments.find(params[:id])
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to user_posts_path
    else
      render :new
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = 'comment deleted successfully.'
    redirect_to user_posts_path(@user)
  end

  private

  def set_user_and_post
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
