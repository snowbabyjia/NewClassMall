class HomeController < ApplicationController
  def index
    @courses = Course.all
    @user = current_user
    if (current_user.present? && !current_user.majors.empty?) 
      @majors = current_user.majors
      @majors_courses = []
      @majors.shuffle.each do |major|
        
        major.courses.each do |course|
          
          if ( @majors_courses.empty? || !@majors_courses.include?(course))
            @majors_courses << course
            
            @courses.delete course
          end
        end
      end
      unless (@majors_courses.empty?)
        @majors_courses.shuffle!
        @courses.shuffle.each do |course|
          @majors_courses << course;
        end
        @courses = @majors_courses;
      end
    else
      @courses = @courses.shuffle
    end
  end
end
