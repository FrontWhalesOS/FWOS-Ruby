class GuessesController < ApplicationController
  before_action :authenticate_with_token!

  def index
    @post = Post.find(params[:post_id])
    @showposts = @post.guesses.all #showing all the guesses of a post
    #how do I do this
    #I have no idea what i am doing
    if @showposts
      render json: {
                      user_id: @user.as_json(only: [:username, :fullname, :email]),
                      id: @guess.id,
                      post_id: @guess.post_id,
                      guess: @guess.guess
                      }

    else
      render json: {errors: @guess.errors.full_messages}
      status: :bad_request

        end




def guesses
  @guess = Guess.find(params[:guess)
end


	def show
		@guess = Guess.find(params[:guess_id])
		@user = User.find(params[:user_id])

    if @guess
              render json: {
                      user_id: @user.as_json(only: [:username, :fullname, :email]),
                      id: @guess.id,
                      post_id: @guess.post_id,
                      guess: @guess.guess
                      }

    else
      render json: {errors: @guess.errors.full_messages}
       status: :bad_request

	end

	def create
    @post = Post.find(params[:post_id])

    score = @post.answer == params[:guess] ? 1 : 0
    if !@post.solution
      @guess = current_user.guesses.new(post_id: params[:post_id],
  											 guess: params[:guess])
      if @guess.save
        render json: {    user_id: @user.as_json(only: [:username, :fullname, :email]),
                          id: @guess.id,
				                  post_id: @guess.post_id,
				                  guess: @guess.guess,
                          points: score}
          status: :created
      # else
      #   render json: {errros: @guess.errors.}
      end
    else
      render json:  {errors: @guess.errors.solution_found}
          status: :completed_solution
    end
  end
end
