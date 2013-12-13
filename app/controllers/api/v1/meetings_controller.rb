class Api::V1::MeetingsController < Api::V1::BaseController
		#load_resource
		# A resource is not loaded if the instance variable is already set. This makes it easy to override
      	# the behavior through a before_filter on certain actions.
		authorize_resource

	def index
#		authorize! :read, Meeting
		respond_with(Meeting.where("date>=?", Date.today))
	end

	def show
	#	authorize! :show, Meeting
		respond_with(Meeting.find(params[:id]))
	end

	def create
	#	authorize! :create, Meeting
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