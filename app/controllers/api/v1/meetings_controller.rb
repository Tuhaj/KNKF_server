class Api::V1::MeetingsController < Api::V1::BaseController

  authorize_resource

  def index
    respond_with(Meeting.where("date>=?", Date.today))
  end

  def show
    respond_with(Meeting.find(params[:id]))
  end

  def create
    meeting = Meeting.new(meeting_params)
    if meeting.save
      respond_with(meeting, location: api_v1_meeting_path(meeting))
    else
      respond_with(meeting)
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:name, :description, :date, :users)
  end

end