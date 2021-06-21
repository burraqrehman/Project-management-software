class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :documentation
      t.integer :project_cost
      t.integer :time_tracking

      t.timestamps 
    end
  end
end
