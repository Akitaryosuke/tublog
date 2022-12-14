class Public::PostsController < ApplicationController
  before_action :set_customer,    only: [:lists]

  def new
    @post = Post.new
    render layout: 'no_sidebar'
  end

  def lists
    @posts = Post.where(customer_id: @customer.id)
    @customers = Customer.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    @post.save
    redirect_to root_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @posts = Post.search(params[:search])
  end

  private

  def post_params
    params.require(:post).permit(:customer_id, :posted_text, :blog)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

end
