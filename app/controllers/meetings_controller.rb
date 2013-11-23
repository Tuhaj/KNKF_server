class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.where("date>=?", Date.today)
  end

  def show
   @meeting = Meeting.find(params[:id])
   render layout: false
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      redirect_to @meeting
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def meeting_params
    params.require(:meeting).permit(:name, :description, :date)
  end
end
