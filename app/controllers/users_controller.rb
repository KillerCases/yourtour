class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  respond_to :html
  
  load_and_authorize_resource

  
  def index
    @users = User.all
  end

  def show
  end

  def edit
  end
  
  def new

  end
  
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    
#     if params[:user][:password].blank?
#       params[:user].delete(:password)
#       params[:user].delete(:password_confirmation)
#     end
    
#     respond_to do |format|
#       if @user.update(user_params)
#             format.html { redirect_to @user, notice: 'User was successfully updated.' }
#             format.json { render :show, status: :ok, location: @user }
#       else
#         format.html { render :edit }
#             format.json { render json: @user.errors, status: :unprocessable_entity }
#       end
#     end
  end
  
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:role, :email, :name)
  end
  
end
