class PostsController < ApplicationController
  def index
    @page_title = 'Post Index Page'
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user.id)
  end

  def show
    @page_title = 'Post Show Page'
  end
end
