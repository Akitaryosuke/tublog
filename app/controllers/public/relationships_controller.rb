class Public::RelationshipsController < ApplicationController
  # フォローするとき
  def create
    following = current_customer.relationships.build(follower_id: params[:customer_id])
    following.save
    redirect_to request.referer
  end

  # フォロー外すとき
  def destroy
    following = current_customer.relationships.find_by(follower_id: params[:customer_id])
    following.destroy
    redirect_to request.referer
  end

  # フォロー一覧
  def followings
    customer = Customer.find(params[:customer_id])
    @customers = customer.followings
  end

  # フォロワー一覧
  def followers
    customer = Customer.find(params[:customer_id])
    @customers = customer.followers
  end
end
