class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :course
      t.references :user

      t.timestamps
    end
    add_index :comments, :course_id
    add_index :comments, :user_id
  end
end
