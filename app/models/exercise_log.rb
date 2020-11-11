class ExerciseLog < ApplicationRecord
  belongs_to :user
  belongs_to :exercise
  validates :user_id, :exercise_id 
  validate :reps_weights_duration_and_notes


  def reps_weights_duration_and_notes 
    if reps.present? 
    

  end 
end
