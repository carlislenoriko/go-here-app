class UsersController < ApplicationController

  def new
    render "new.html.erb"
  end

  def create
    puts params[:first_name]
    user = User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      avatar: params[:avatar]
      )
    if user.save
      session[:user_id] = user.id
      # flash[:success] = "Successfully created account! Woot!"
      redirect_to "/home"
    else
      # flash[:warning] = "Invalid email or password!"
      redirect_to '/'
    end
  end

  def edit
    @user = User.find(params[:id])
    render "edit.html.erb"
  end

  def show
    @user = User.find(params[:id])
    @friends = []
    @user.friends.each do |friend|
      @friends << friend.follower_id
    end
    render "show.html.erb"
  end

  def update
    user = User.find(params[:id])
    user.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      avatar: params[:avatar]
    )
    redirect_to "/home"
  end

  def destroy
  end

end