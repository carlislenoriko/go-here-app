class UsersController < ApplicationController

  def new
  end

  def create
    user = User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    if user.save
      # session[:user_id] = user.id
      flash[:success] = "Successfully created account! Woot!"
      redirect_to '/'
    else
      flash[:warning] = "Invalid email or password!"
      redirect_to "/signup"
    end
  end

  def edit
    @user = User.find(params[:id])
    render "edit.html.erb"
  end

  def show
  end

  def update
    user = User.find(params[:id])
    user.update(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation]
    )
    redirect_to "/"
  end

  def destroy
  end

end