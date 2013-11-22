class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.where("date>=?", Date.today)
  end

  def show
   @meeting = Meeting.find(params[:id])
   render layout: false
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
