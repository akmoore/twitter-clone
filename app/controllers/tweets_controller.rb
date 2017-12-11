class TweetsController < ApplicationController

  before_action :authenticate_user!
  before_action :get_tweet, only: [:edit, :show, :update, :destroy]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    # @tweet.user_id = current_user.id #=> another, more secure way of assigning the user to a tweet, by passing user interference
    if @tweet.save
      redirect_to @tweet, notice: 'Successfully saved tweet'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: 'Successfully updated tweet'
    else
      flash.now[:alert] = "There was a problem in updating your tweet."
      render :edit
    end
  end

  def show
  end

  def destroy
    if @tweet.destroy
      redirect_to tweets_url, notice: 'Tweet was successfully deleted.'
    else
      flash.now[:alert] = "Unable to delete tweet. Try Again."
    end
  end
  
  private
  
  def tweet_params
    params.require(:tweet).permit(:message, :user_id)
  end
  
  def get_tweet
    @tweet = Tweet.find(params[:id])
  end

end
