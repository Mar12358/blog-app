class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user = @user || User.first
  end

  def add_like
    @like = Like.new(user: @user, post: @post)
    nil unless @like.save
  end

  helper_method :current_user
end
