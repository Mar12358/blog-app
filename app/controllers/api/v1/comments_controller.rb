class Api::V1::CommentsController < ApplicationController
    def index
        @post = Post.includes(:comments).find(params[:post_id])

        respond_to do |format|
            format.json { render json: @post.comments}
        end
    end
end