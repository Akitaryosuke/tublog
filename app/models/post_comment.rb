class PostComment < ApplicationRecord
  belongs_to :customer
  belongs_to :post

  validates :comment_text, presence: true, length: { maximum: 1000 }
end
