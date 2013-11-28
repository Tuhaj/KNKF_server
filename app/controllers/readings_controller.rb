class ReadingsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :index, :show, :edit, :update]
  before_action :set_reading, only: [:show, :edit, :update, :destroy]
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
  end

  def edit
  end

  def update
  end

  def destroy
    @reading.destroy
    redirect_to readings_path
  end

  private

 def set_reading
      @reading = Reading.find(params[:id])
    end
def reading_params
    params.require(:reading).permit(:author, :title, :description, :votes_for, :is_reworked, :meeting)
  end
  
end