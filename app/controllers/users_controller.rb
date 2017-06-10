class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザーを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました。'
      render :new
    end
  end

  def edit
  end
  
  def update
  end

  def destroy
  end

  def reviews
    @user = User.find(params[:id])
    @review_spas = @user.review_spas.page(params[:page])
    counts(@user)
  end

  private

  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def set_prefectures
      @prefectures = Prefecture.all.pluck(:name,:id)
  end
end