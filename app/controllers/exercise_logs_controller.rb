class ExerciseLogsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_exercise_log, only: [:show, :edit, :update, :destroy]
    
    def index 
        @exercise = Exercise.find_by_id(params[:exercise_id])
        if @exercise
            @exercise_logs = @exercise.exercise_logs
        else 
            @exercise_logs = current_user.exercise_logs
        end 
    end 

    def show 

    end 

    def new 
        @exercise = Exercise.find_by_id(params[:exercise_id])
        if @exercise
            @exercise_log = @exercise.exercise_logs.build
        else 
            @exercise_log = ExerciseLog.new   
        end 
         
    end 
    
    def create 
        @exercise_log = current_user.exercise_logs.build(exercise_log_params)
        if @exercise_log.save 
            redirect_to exercise_log_path(@exercise_log)
        else 
            render :new 
        end  
    end 

    def edit 

    end 

    def update
        if @exercise_log.update(exercise_log_params)
            redirect_to exercise_log_path(@exercise_log)
        else 
            render :edit
        end 
    end 

    def destroy 
        @exercise_log.destroy
        redirect_to exercise_logs_path
    end 

    private

    def set_exercise_log
        @exercise_log = current_user.exercise_logs.find(params[:id])
    end 

    def filter_options
        if params[:sort_alphabetically] == "alphabetical"
            @exercises = Exercise.name.alphabetical
        end 

        if params[:sort] == "popular"
            @exercises = Exercise.exercise_log_count.popular
        end 
    end 

    def exercise_log_params
        params.require(:exercise_log).permit(:exercise_id, :user_id, :reps, :weight, :duration, :notes)
    end 
  
end
