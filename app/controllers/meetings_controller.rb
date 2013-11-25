class MeetingsController < ApplicationController
#czy only jest dobre?
  before_action :set_meeting, only: [:show, :edit, :update, :destroy, :add_me, :remove_me]
  before_filter :authenticate_user! , only: [:new,:show,:edit,:update,:my, :add_me, :remove_me]

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
    render :index
  end

  def my
  end

  def add_me
    @meeting.users << current_user
    redirect_to @meeting
  end
  def remove_me
    @meeting.users.destroy(current_user)
    redirect_to meetings_my_path
  end

  private

   def set_meeting
      @meeting = Meeting.find(params[:id])
    end

  
  def meeting_params
    params.require(:meeting).permit(:name, :description, :date, :users)
  end
end
