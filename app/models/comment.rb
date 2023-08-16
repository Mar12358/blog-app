class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post', foreign_key: :post_id

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end