class Comment < ApplicationRecord
  belongs_to :usebelongs_to :author, class_name: "User"
  belongs_to :post
end
