class Like < ApplicationRecord
  belongs_to :post, class_name: 'Post'
  belongs_to :author
  after_create :update_likes_counter
  after_delete :update_likes_counter

  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
