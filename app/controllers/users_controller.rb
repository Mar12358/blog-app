class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @page_title = 'User Index Page'
    @users = User.all
  end

  def show
    @page_title = 'User Show Page'
    @user = User.find(params[:id])
    @posts = Post.where(author_id: @user.id)
  end
end
