class CoursesDistributions < ActiveRecord::Migration
  def change
    create_table :courses_distributions, :id => false do |t|
      t.integer :course_id
      t.integer :distribution_id
    end
  end
end
