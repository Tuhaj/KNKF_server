class Api::V1::MeetingsController < Api::V1::BaseController
	def index
		respond_with(Meeting.where("date>=?", Date.today))
	end

	def show
		respond_with(Meeting.find(params[:id]))
	end
end