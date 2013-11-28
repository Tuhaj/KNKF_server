class ReadingsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :index, :show, :edit, :update, :vote]
  before_action :set_reading, only: [:show, :edit, :update, :destroy, :vote]
  def index
    @readings = Reading.all
  end

  def show
    @reading = Reading.find(params[:id])
  end

  def new
    @reading = Reading.new
  end

  def create
    @reading = Reading.new(reading_params)
    @reading.recomended_by = current_user
    @reading.votes_for = 0
    @reading.is_reworked = false
    if @reading.save
      redirect_to readings_path, :notice => "Udało się dodać lekturę"
    else
      render :new
    end
  end

  def edit
    @reading = Reading.find(params[:id])
  end

  def update
  end

  def destroy
    @reading.destroy
    redirect_to readings_path, alert: "Usunąłem lekturę"
  end

  def vote
    @reading.votes_for = @reading.votes_for + 1 
    @reading.save
    redirect_to readings_path, alert: "Oddałeś głos na autora: #{@reading.author} tytuł: #{@reading.title}"
  end

  private

 def set_reading
      @reading = Reading.find(params[:id])
    end
def reading_params
    params.require(:reading).permit(:author, :title, :description, :votes_for, :is_reworked, :meeting)
  end
  
end