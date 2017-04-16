class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])

    puts @tweet.content
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update_attributes(tweet_params)
      redirect_to tweets_path
    else
      render :edit
    end
  end

end

private

  def tweet_params
    params.require(:content).permit(:handle)
  end
