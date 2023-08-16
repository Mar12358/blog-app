class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :posts, class_name: 'Post', foreign_key: :post_id

  def update_comments_counter
    posts.update(comments_counter: posts.comments.count)
  end
end