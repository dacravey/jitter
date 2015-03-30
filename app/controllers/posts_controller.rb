class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
    @post - Post.new
  end

  def create
    @user = User.find(current_user.id)
    @post = @user.posts.new(posts_params)
    if @post.save
      flash[:success] = "Post succesfully added"
      redirect_to root_path
    else
      flash[:danger] = "There was a problem creating your listing, please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post successfully updated"
      redirect_to user_path(@user)
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @post = Post.find(params[:id])
    @post.destroy
    flash[:danger] = "Post successfully deleted"
    redirect_to user_path(@user)
  end

private
  def post_params
    params.require(:post).permit(:post)
  end
end
