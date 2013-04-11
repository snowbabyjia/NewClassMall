class CoursesMajors < ActiveRecord::Migration
  def change
    create_table :courses_majors, :id => false do |t|
      t.integer :course_id
      t.integer :major_id
    end
  end
end
