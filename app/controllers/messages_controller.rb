class MessagesController < ApplicationController
  before_filter :authenticate_user!, only: [:new]
  def new
  	    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
		if @message.save
		    redirect_to home_index_path, :notice => "Udało się wysłać formularz"
	    else
	      render :new
	    end
  end


	def message_params
    params.require(:message).permit(:content, :membership, :title)
  end

end