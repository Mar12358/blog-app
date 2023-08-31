class Api::V1::PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find(params[:user_id])

    respond_to do |format|
      format.json { render json: @user.posts }
    end
  end
end
