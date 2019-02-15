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
    
    @all_ratings = Movie.getall_ratings

      if params[:ratings] != nil
        session[:ratings] = params[:ratings].keys
      else
        session[:ratings] = params[:ratings]
        @given_hash = session[:ratings]
        @given_hash = Movie.getall_ratings if session[:ratings] == nil
      end

    if params[:sort]
      session[:sort] = params[:sort]
      @sort = params[:sort]
    else
      @sort = session[:sort]
    end

#    @given_hash = Movie.load_hash_keys unless session[:ratings]
#    @given_hash = session[:ratings]
#    @sort = session[:sort] unless params[:sort]

    @movies = Movie.getmovie_rating(@given_hash)

    if @sort == "title"
          @css_selector1 = "hilite"
          @movies = Movie.getmovie_rating(@given_hash).order(:title)
    elsif @sort == "release_date"
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