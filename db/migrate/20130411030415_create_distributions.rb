class CreateDistributions < ActiveRecord::Migration
  def change
    create_table :distributions do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
