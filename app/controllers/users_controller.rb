class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  def friend_invite
    @other_user = User.find(params[:id])
    flash[:success] = "This user will get a friend request."
  end
end
