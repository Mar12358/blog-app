class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all

    respond_to do |format|
      format.json { render json: @users }
    end
  end
end
