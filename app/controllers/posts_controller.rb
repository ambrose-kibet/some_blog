class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new; end

  def create
    @post = current_user.posts.new(params.require(:post).permit(:title, :text))
    if @post.save
      flash[:notice] = 'post created successfully.'
      redirect_to user_posts_path(current_user)
    else
      flash[:alert] = 'post creation failed.'
      render :new
    end
  end
end
