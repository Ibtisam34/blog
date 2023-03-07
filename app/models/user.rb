class User < ApplicationRecord
  has_many :post, :comment, :like
end
