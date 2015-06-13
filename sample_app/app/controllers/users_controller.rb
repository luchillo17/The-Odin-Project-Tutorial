class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action only: [:new, :create] { |controller| @title = 'Sign Up' }
  before_action only: [:edit, :update] { |controller| @title = 'Edit User: ' + @user.name }

  # GET /users
  # GET /users.json
  def index
    @title = 'Users'
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @title = @user.name + 'Profile'
  end

  # GET /users/new
  def new
    # @title = 'Sign Up'
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    # @title = 'Edit User: ' + @user.name
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, flash: { success: 'User was successfully created.' }}
        format.json { render :show, status: :created, location: @user }
      else
        # @title = 'Sign Up'
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, flash: { success: 'User was successfully updated.' }}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, flash: { success: 'User was successfully destroyed.' }}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end