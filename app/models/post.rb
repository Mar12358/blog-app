class Post < ApplicationRecord
  has_many :comments, foreign_key: :post_id
  has_many :likes
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
