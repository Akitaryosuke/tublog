class Public::PostDetailsController < ApplicationController

  def new
    @post_detail = PostDetail.new
    render layout: 'no_sidebar'
  end

  def show
    @post_detail = PostDetail.find(params[:id])
  end

  def destroy

  end

  private

  def post_detail_params
    params.require(:post_detail).permit(:customer_id, :blog)
  end

end
