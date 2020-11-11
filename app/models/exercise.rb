class Exercise < ApplicationRecord
    belongs_to :exercise_log, counter_cache: true 
    has_many :users, through: :exercise_logs, counter_cache: true 
    validates :name, presence: true 

    def self.popular
        order(appointment_count: :desc)
    end 
end
