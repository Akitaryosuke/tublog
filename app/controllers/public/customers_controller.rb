class Public::CustomersController < ApplicationController
  before_action :set_customer,    only: [:favorites, :shares]
  before_action :correct_customer,only: [:edit, :update]

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    if params[:id] == current_customer.id
      @customer = Customer.find(params[:id])
      render action: :edit
    else
      @customer = current_customer
      render action: :edit, layout: 'no_sidebar'
    end
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to public_customer_path(current_customer.id)
  end

  def destroy
    Customer.find(params[:id]).destroy
    flash[:success] = "Customer deleted"
    redirect_to root_path
  end

  def favorites
    favorites = Favorite.where(customer_id: @customer.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  def shares
    shares = Share.where(customer_id: @customer.id).pluck(:post_id)
    @share_posts = Post.find(shares)
  end

  def follows
    @customers = Customer.where.not(id: current_customer.id)
  end

  def followings
    customer = Customer.find(params[:id])
    @customers = customer.followings
  end

  def followers
    customer = Customer.find(params[:id])
    @customers = customer.followers
  end

private
  def customer_params
    params.require(:customer).permit(:name, :introduction, :email, :encrypted_password, :header_image, :avater_image)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
  
  def correct_customer
    @customer = Customer.find(params[:id])
    redirect_to(public_customer_path(current_customer.id)) unless @customer == current_customer
  end

end
