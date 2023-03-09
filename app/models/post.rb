class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  def update_comments_count
    update(comments_count: comments.count)
  end
end
