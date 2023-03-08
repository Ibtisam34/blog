class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :update_likes_counter

  private

  def update_likes_counter
    update(likes_count: likes.count)
  end

  def update_user_posts_counter
    author.update(posts_count: author.posts.count)
  end

  def recent_comments(count)
    comments.order(created_at: :desc).limit(count)
  end
end
