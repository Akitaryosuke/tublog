class Public::SharesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    share = current_customer.shares.new(post_id: post.id)
    share.save
    redirect_to request.referer
  end

  def destroy
    post = Post.find(params[:post_id])
    share = current_customer.shares.find_by(post_id: post.id)
    share.destroy
    redirect_to request.referer
  end

end
