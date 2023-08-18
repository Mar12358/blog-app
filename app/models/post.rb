class Post < ApplicationRecord
  has_many :comments, foreign_key: :post_id
  has_many :likes
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  after_create :update_posts_counter
  after_destroy :update_posts_counter

  validates :title, presence: true, length: { maximum: 250, too_long: '%<count>s characters is the maximum allowed' }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
