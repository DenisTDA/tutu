class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: %i[show edit update destroy]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit(:name, :lastname)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
