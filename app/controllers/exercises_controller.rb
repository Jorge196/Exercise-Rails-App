class ExercisesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_exercise, only: [:show, :edit, :update, :destroy]
    def index 
        @exercises = Exercise.all
    end 

    def show 
        
    end 
    
    def new 
        @exercise = Exercise.new
    end 

    def create
        @exercise = Exercise.new(exercise_params)
        if @exercise.save
            redirect_to exercise_path(@exercise)
        else 
            render :new 
        end 
    end
    

    private 

    def set_exercise
        @exercise = Exercise.find(params[:id])
    end 

    def exercise_params 
        params.require(:exercise).permit(:name, :exercise_log_count)
    end 


end
