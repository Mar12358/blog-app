class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_user

  def index
    @page_title = 'Post Index Page'
    @user = User.includes(:posts).find(params[:user_id])
    @posts = Post.includes(:author, :comments, :likes).where(author_id: @user.id)
  end

  def show
    @page_title = 'Post Show Page'
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = @user.posts.build
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.comments.destroy_all
    @post.destroy
    redirect_to user_posts_path(params[:user_id])
  end

  def like
    @post = @user.posts.find(params[:id])
    @like = @post.likes.create(author: current_user)
    @like.save
    redirect_to user_post_path(@user, @post)
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
