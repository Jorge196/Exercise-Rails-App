class ExerciseLogsController < ApplicationController
    before_action :authenticate_user!
    
    def index 
        @exercise = current_user.exercises.all
    end 

    def new 
        
    end 

    def show 
    end 

    def edit 
    end 

    private 

    def exercise_params 

end
