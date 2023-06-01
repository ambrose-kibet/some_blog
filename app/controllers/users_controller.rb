class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  
  #add show method
  def show
    @user = User.find(params[:id])
  end
end
