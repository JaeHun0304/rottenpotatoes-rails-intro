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

    if @movies == nil
      @movies = Movie.all
      @selected_movies = Movie.all
    else
      @movies = @selected_movies.sort_by(parmas[:sort])
        if params[:sort] == "title"
          @css_selector1 = "hilite"
        elsif params[:sort] == "release_date"
          @css_selector2 = "hilite"
        else
        end
    end

    @all_ratings = Hash.new

    if @all_ratings.empty? == true
      Movie.find_each do |movie|
        if @all_ratings.has_key?(movie.rating) == false 
        @all_ratings.store(movie.rating, true)
        end
      end
    end

    if params[:ratings] != nil
        @movies = Movie.where(rating: params[:ratings].keys).order(params[:sort])
        @selected_movies = @movies
        
        params[:ratings].each_key do |rating| 
          @all_ratings[rating] = false
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