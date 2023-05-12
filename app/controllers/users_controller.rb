class UsersController < ApplicationController
  def new
    @user = User.new
    @cities = City.new
  end

  def create
    @user = User.new(user_params)
    @city = City.find_or_create_by(name: params[:user][:city_name], zip_code: params[:user][:city_zip_code])
    @user.city = @city
    
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
