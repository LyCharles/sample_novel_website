class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = t('sessions.create.success')
      redirect_to root_path
    else
      flash.now[:alert] = t('sessions.create.error')
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = t('sessions.destroy.success')
    redirect_to root_path
  end
end
