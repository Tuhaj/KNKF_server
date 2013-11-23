class MeetingsController < ApplicationController

  before_action :set_meeting, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user! , only: [:new,:show,:edit,:update,:my]

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
    @meeting.destroy
    redirect_to @meeting
  end

  def my
  end

  def form
    @meeting = Meeting.new
  end
  
  private

   def set_meeting
      @meeting = Meeting.find(params[:id])
    end

  
  def meeting_params
    params.require(:meeting).permit(:name, :description, :date)
  end
end
