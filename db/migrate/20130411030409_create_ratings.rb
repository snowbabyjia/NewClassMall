class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :score
      t.references :course
      t.references :user

      t.timestamps
    end
    add_index :ratings, :course_id
    add_index :ratings, :user_id
  end
end
