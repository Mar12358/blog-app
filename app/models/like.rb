class Like < ApplicationRecord
  belongs_to :post, class_name: 'Post'
  belongs_to :author

  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end