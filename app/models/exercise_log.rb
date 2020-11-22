class ExerciseLog < ApplicationRecord
  belongs_to :user
  belongs_to :exercise, counter_cache: :exercise_log_count  
  validate :reps_weight_duration_and_notes


  def reps_weight_duration_and_notes
    unless (reps.present? && weight.present?) || duration.present? || notes.present? 
      self.errors.add(:not_implemented, "workout must contain either reps and weight, duration, or notes")
    end
  end 
end
