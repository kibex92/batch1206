get "/songs", to: "songs#index"
get "/songs/new", to: "songs#new"
post "songs", to: "songs#create"
get "songs/:id", to: "songs#show"

get "songs/:id", to: "songs#edit"
patch "songs/:id". to: "songs#update"

delete "songs/:id", to: "songs#destroy"

class SongsController < ApplicationController
  def index
    @songs = Song.all
  end


  def show
    @song = Song.find(params[:id])
  end
  
end

class SongsController < ApplicationController
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save!
      redirect_to songs_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :year, :category)
  end
end

class ReviewsController < ApplicationController
  before_action :set_song

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.song = @song

    if @review.save!
      redirect_to song_path(@song)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_song
    @song = Song.find(params[:song_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end



