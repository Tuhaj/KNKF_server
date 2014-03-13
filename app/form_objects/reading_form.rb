class ReadingForm
  include ActiveModel::Validations
  validates :title, presence: true
  validates :author, presence: true

  delegate :new_record?, :author, :title, :description, to: :reading

  attr_reader :reading

  def initialize(reading)
    @reading = reading
  end

  def update(params)
    reading.author = params[:author]
    reading.title = params[:title]
    reading.description = params[:description]
    reading.save
  end
end
