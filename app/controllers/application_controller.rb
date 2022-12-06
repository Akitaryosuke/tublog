class ApplicationController < ActionController::Base
#SQLite3::ConstraintException: NOT NULL constraint failed: customers.nameのエラーが出るので記述が必要
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_customer!, except: [:top]

  def search
    #ViewのFormで取得したパラメータをモデルに渡す
    @posts = Post.search(params[:search])
  end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :introduction])
  end
end
