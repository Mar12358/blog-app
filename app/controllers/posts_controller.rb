class PostsController < ApplicationController
  def index
    @page_title = "Post Index Page"
    @style_file = "post_index"
  end
  def show
    @page_title = "Post Show Page"
    @style_file = "post_show"
  end
end
