class SessionsController < ApplicationController
  def new
  end

  def create
    # render json: params
    user = User.find_by_email params[:email]
    if user && user.authenticate(params[:password])
      # the sign_in method is defined in application controller
      sign_in(user)

      redirect_to root_path, notice: "Welcome #{user.first_name}!"
    else
      flash[:alert] = "wrong credentials"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out! We will miss you!"
  end

end
