class FriendshipsController < ApplicationController
  def create
    @other_user = User.find(params[:id])
    
  end
end
