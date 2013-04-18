class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
  
  def add_course
    @course = Course.find(params[:course_id])
    unless current_user.courses.include?(@course)
      current_user.courses << @course
      redirect_to course_path(@course), :notice => "Added course!"
    else
      redirect_to course_path(@course), :notice => "Did not add course. You already have it."
    end
  end
  
  def delete_course
    @course = Course.find(params[:course_id])
    current_user.courses.delete @course
    redirect_to user_path(current_user), :notice => "Deleted course!"
  end
end
