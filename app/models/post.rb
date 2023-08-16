class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end