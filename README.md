# README

## Dependencies (Gems/packages)
omniauth
omniauth-google-oauth2
dotenv-rails

## Configuration (environment variables/other stuff in config folder)

config/initializers/devise.rb

config.omniauth :google_oauth2, ENV['GOOGLE_OAUTH_CLIENT_ID'], ENV['GOOGLE_OAUTH_CLIENT_SECRET']

## What is the Many to many relationship and how is it used?
User <=> Exercises, a view that displays all the user's exercises and a view that shows all the exercises the user has done for what amount a time
/user/:user_id/exercises
/exercises/:exercise_id/users 
class User
  has_many :exercise_logs
  has_many :exercises, -> { distinct }, through: :exercise_logs
end


## What is the User Submittable attribute on the join model?
	Time it took to perform exercise, weight, reps and sets. (Include notes for more details.)




## What Validations do we need?
	User must have email presence and uniqueness 
	Exercises must have name 
	Exercise_log must have user_id, exercise_id, reps, weight
		Custom_validation has to have reps and weight or duration or notes 
		If none are true error must say that it must have either of these things

## What does the schema for our app look like?
	Table migration for: users 
t.string :email
t.string :user_name
	Class User 
		has_many  :exercise_logs 
		has_many :exercises, through: :exercise_logs 
		validates :email, presence: true, uniqueness: true 
		validates :user_name, presence: true 

	table migration for: exercises
	t.string :name 
	t.integer :exercise_log_count 

		class Exercise 
			belongs_to :exercise_log 
			has_many :users, through: :exercise_logs
			validates :name, presence: true 

	table migration for: exercise_logs 
	t.references :user 
	t.references :exercise 
	t.integer :reps 
	t.integer :weights 
	t.integer :duration 
	t.string :notes 
	
	class Exercise_Log	
belongs_to :user 
belongs_to :exercise 
validates :user_id, :exercise_id 
validate (custom_validation where should have a note, or reps and weight, or duration)
end 
			
		

## What are our Nested Routes? (We need a nested new route and either a nested index or nested show route)
/exercises/:exercise_id/exercise_logs/new => where you add new exercise to the exercise log 
/exercises/:exercise_id/exercise_logs => where you will view all the exercises in the exercise log 

## Do we have Non Nested Versions of those nested routes?
/exercise_logs/new => new exercise_log form where  user will select an exercise 
/exercise_logs => exercise_log of the user 
## What Scope Method(s) do we have and how are they used?
class Exercise
  belongs_to :user, counter_cache: true
  belongs_to :exercise_log, counter_cache: true
end

def self.popular
    order(exercise_log_count: :desc)
end

## How do users fit into the application? How are they related to the other models?
Users are people who will be logging their exercises, can track their own progress 
Can view their own logs but not other people’s exercise logs 
Exercises can be seen by all users and added by them, but cannot delete or update them
Exercise will not be owned by one user in order to not be edited or deleted by other users 

