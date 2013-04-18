class HomeController < ApplicationController
  def index
    @courses = Course.all
    @user = current_user
  end
end
