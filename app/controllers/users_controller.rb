class UsersController < ApplicationController
  def new
  end

   def create
        @user = User.create(user_params)
        if !@user.errors.full_messages.empty?
            flash[:error] = @user.errors.full_messages
            redirect_to "/"
        else 
            redirect_to '/sessions/new' 
        end
    end

  def show
  end

  def edit
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
