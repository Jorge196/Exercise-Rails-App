class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :exercise_log_count

      t.timestamps
    end
  end
end
