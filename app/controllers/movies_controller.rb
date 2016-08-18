class MoviesController < ApplicationController
  def index
    if params[:search]
      @movies = Movie.search(params[:search], params[:search])
    elsif params[:duration]
      if params[:duration] == 1.to_s
        @movies = Movie.duration_less_than_90
      elsif params[:duration] == 2.to_s
        @movies = Movie.duration_90_to_120
      else params[:duration] == 3.to_s
        @movies = Movie.duration_more_than_120
      end
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new 
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else 
      render :new
    end 
  end 

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end 

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy 
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :image, :description
      )
  end 

end
