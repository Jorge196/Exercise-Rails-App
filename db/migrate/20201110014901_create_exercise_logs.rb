class CreateExerciseLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :exercise_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.integer :reps
      t.integer :weight
      t.integer :duration
      t.string :notes

      t.timestamps
    end
  end
end
