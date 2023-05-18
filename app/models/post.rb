class User < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  after_create :update_user_posts_counter
  after_destroy :update_user_posts_counter

  def update_user_posts_counter
    user.update(posts_counter: user.posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end