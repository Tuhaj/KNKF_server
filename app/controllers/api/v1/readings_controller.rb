class Api::V1::ReadingsController < Api::V1::BaseController

  authorize_resource
  load_resource

  def index
    respond_with(Reading.active)
  end

  def show
    respond_with(Reading.find(params[:id]))
  end

  def create
    reading = Reading.new(reading_params)
    if reading.save
      respond_with(reading, location: api_v1_reading_path(reading))
    else
      respond_with(reading)
    end
  end

  def destroy
    reading = Reading.find(params[:id])
    reading.destroy
    respond_with(reading)
  end

  private

  def reading_params
    params.require(:reading).permit(:author, :title, :description, :votes_for, :is_reworked, :meeting)
  end
  
end