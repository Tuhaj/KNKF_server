class ReadingsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_reading, only: [:show, :edit, :update, :destroy]
  before_action :set_reading_id, only: [:vote, :unvote]

  def index
    @readings = Reading.all
  end

  def show
  end

  def new
    @reading_form = NewReadingForm.new(current_user)
  end

  def create
    @reading_form = NewReadingForm.new(current_user)
    if @reading_form.update(reading_params)
      redirect_to readings_path, :notice => "Udało się dodać lekturę"
    else
      render :new
    end
  end

  def edit
    @reading_form = ReadingForm.new @reading
  end

  def update
    @reading_form = ReadingForm.new @reading
    if @reading_form.update(reading_params)
      redirect_to readings_path, notice: 'Poprawiono dane lektury.'
    else
      render action: 'edit'
    end
  end

  def destroy
    authorize! :destroy, @reading
    @reading.destroy
    redirect_to readings_path, alert: "Usunąłem lekturę"
  end

  def vote
    @reading.votes_for = @reading.votes_for + 1
    @reading.save!
    current_user.has_a_vote = false
    current_user.reading = @reading
    current_user.save!
    redirect_to readings_path, alert: "Oddałeś głos na autora: #{@reading.author} tytuł: #{@reading.title}"
  end

  def unvote
    @reading.votes_for = @reading.votes_for - 1
    @reading.save!
    current_user.has_a_vote = true
    current_user.reading = nil
    current_user.save!
    redirect_to readings_path, alert: "Wycofano głos na autora: #{@reading.author} tytuł: #{@reading.title}"
  end

  private

  def set_reading
    @reading = Reading.find(params[:id])
  end
  def set_reading_id
    @reading = Reading.find(params[:reading_id])
  end

  def reading_params
    params.require(:reading).permit(:author, :title, :description, :votes_for, :is_reworked, :meeting)
  end

end