class ExerciseLog < ApplicationRecord
  belongs_to :user
  belongs_to :exercise
  validates :user_id, :exercise_id 
  validate :reps_weight_duration_and_notes


  def reps_weight_duration_and_notes
    unless (reps.present? && weight.present?) || duration.present? || notes.present? 
      errors.add("Workout must contain either 'reps and weight, duration, or notes'")
    end
  end 
end
