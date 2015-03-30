class UsersController < ApplicationController

  def index
    @posts = Post.all.reverse
  end

  def show
    @user = User.find(params[:id])
  end
end
