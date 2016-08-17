class MoviesController < ApplicationController
  def index
    if Movie.where("title like ?", "%#{params[:title]}%") && params[:title].present?
      @movies = Movie.where("title like ?", "%#{params[:title]}%") 
    elsif Movie.where("director like ?", "%#{params[:director]}%") && params[:director].present?
      @movies = Movie.where("director like ?", "%#{params[:director]}%")
    elsif params[:duration].present?
      if params[:duration] == 1.to_s
        @movies = Movie.where("runtime_in_minutes < ?", 90) 
      elsif params[:duration] == 2.to_s
        @movies = Movie.where("runtime_in_minutes in (?)", 90..120)
      else params[:duration] == 3.to_s
        @movies = Movie.where("runtime_in_minutes > ?", 120)
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
