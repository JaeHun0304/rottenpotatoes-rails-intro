class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index

    if params[:ratings] == nil && params[:sort] == nil
      @given_hash = Movie.getall_ratings(@given_hash)
    end

    @given_hash = params[:ratings].keys
    @movies = Movie.getmovie_rating(@given_hash)
    @all_ratings = Movie.getall_ratings(@all_ratings)

    if params[:sort] == "title"
          @css_selector1 = "hilite"
          @movies = Movie.getmovie_rating(@given_hash).order(:title)
    elsif params[:sort] == "release_date"
          @movies = Movie.getmovie_rating(@given_hash).order(:release_date)
          @css_selector2 = "hilite"
    else
    end

  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
  
  
end