class Post < ApplicationRecord
  has_many :posts
  has_many :likes
  belongs_to :users
end