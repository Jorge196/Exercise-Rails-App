class Exercise < ApplicationRecord
    has_many :exercise_logs
    has_many :users, -> { distinct }, through: :exercise_logs
    validates :name, presence: true, uniqueness: true
    

    def self.popular
        order(exercise_log_count: :desc)
    end 
    
    def self.alphabetical 
        order(:name, exercise: :asc)
    end 

end
