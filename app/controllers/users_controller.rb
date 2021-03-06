class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:index, :destroy]

  def index
    @users= User.paginate(page: params[:page])
  end

	def show
		@user = User.find(params[:id])
    @books = @user.books.order(sort_column + " " + sort_direction).paginate(page: params[:page])
	end
  	 
  	def new
  		@user = User.new
  	end

  	def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user 
    	flash[:success] = "Welcome to Mi Codex."
      redirect_to root_url 
    else 
      render 'new'
    end
  end

  def edit
    
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to root_url
    else
      render 'edit'
    end
    
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  private

    def sort_column
      @user.books.column_names.include?(params[:sort]) ? params[:sort] : "title"
    end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
