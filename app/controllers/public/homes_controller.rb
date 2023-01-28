class Public::HomesController < ApplicationController

  def top
    @posts = Post.all.order(created_at: :desc)
    @customers = Customer.all
    @customer = Customer.find_by(params[:customer_id])
  end

  def search
    #ViewのFormで取得したパラメータをモデルに渡す
    @posts = Post.search(params[:search])
  end

end
