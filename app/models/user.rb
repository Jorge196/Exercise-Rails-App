class User < ApplicationRecord
    has_many :exercise_logs 
    has_many :exercises, through: :exercise_logs 
    validates :email, presence: true, uniqueness: true
    validates :user_name, presence: true  
end
