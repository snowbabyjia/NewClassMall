class CoursesProfessors < ActiveRecord::Migration
  def change
    create_table :courses_professors, :id => false do |t|
      t.integer :course_id
      t.integer :professor_id
    end
  end
end
