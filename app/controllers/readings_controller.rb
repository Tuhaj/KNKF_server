class ReadingsController < ApplicationController
  before_filter :authenticate_user! , only: [:new,:index, :show, :edit, :update]
  before_action :set_reading, only: [:show, :edit, :update, :destroy]
  def index
    @readings = Reading.all
  end

  def show
    @meeting = Meeting.find(params[:id])
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

 def set_meeting
      @meeting = Meeting.find(params[:id])
    end