class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create

    @user = User.authenticate_with_credentials(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to products_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :products
  end



end
