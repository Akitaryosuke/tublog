class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :header_image
  has_one_attached :avater_image

  has_many :posts, dependent: :destroy
  #いいね
  has_many :favorites, dependent: :destroy
  #共有
  has_many :shares, dependent: :destroy
  # フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: :follower_id
  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :follower
  has_many :followers, through: :reverse_of_relationships, source: :following
  has_many :post_comments, dependent: :destroy

  def is_followed_by?(customer)
    reverse_of_relationships.find_by(following_id: customer.id).present?
  end

  def favorited_by?(post_id)
    favorites.where(post_id: post_id).exists?
  end

  def shared_by?(post_id)
    shares.where(post_id: post_id).exists?
  end

end
