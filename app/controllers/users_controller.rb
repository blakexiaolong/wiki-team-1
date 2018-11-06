class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User was successfully created." 
    end
    redirect_to @user
  end
  
  # PATCH/PUT /users/1
  def update
    if @user.data(user_params)
      flash[:success] = "User was successfully updated."
    end
    redirect_to @user
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy    
    @user.destroy
      flash[:success] = "User was successfully destroyed."
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :admin)
    end
end
