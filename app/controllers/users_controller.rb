class UsersController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @user = User.find(params[:id])
  end
end
