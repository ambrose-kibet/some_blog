class PostsController < ApplicationController
  def index
    @user = User.includes(posts: { comments: :user }).find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new; end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = 'Post created successfully.'
      redirect_to user_posts_path(current_user)
    else
      flash[:alert] = 'Post creation failed.'
      render :new
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted successfully.'
    redirect_to user_posts_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
