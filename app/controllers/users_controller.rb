class UsersController < ApplicationController
  def index
    @page_title = "User Index Page"
    @style_file = "user_index"
    @users = User.all
  end
  def show
    @page_title = "User Show Page"
    @style_file = "user_show"
  end
end
