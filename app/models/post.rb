class Post < ApplicationRecord

  belongs_to :customer
  has_many :favorites, dependent: :destroy
  has_many :shares, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer)
  end

  def shared_by?(customer)
    shares.exists?(customer_id: customer)
  end

end
