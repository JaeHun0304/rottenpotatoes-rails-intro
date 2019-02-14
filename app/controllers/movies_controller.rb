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
    @movies = Movie.all
    @all_ratings = Hash.new

    if params[:sort] == "title"
        @css_selector1 = "hilite"
        @movies = Movie.order(:title)
    elsif params[:sort] == "release_date"
        @css_selector2 = "hilite"
        @movies = Movie.order(:release_date)
    else
    end

    @all_ratings.each_key do |key|
      if parmas[:ratings].has_key?(key) == false
         @all_ratings[key] = false
      end
    end

    Movie.find_each do |movie|
      if @all_ratings.include?(movie.rating) == false
        @all_ratings.store(movie.rating, true)
      elsif params[:ratings] != nil
        @movies = Movie.where(params[:ratings].has_key?(movie.rating) == true)
      end
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