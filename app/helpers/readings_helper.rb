module ReadingsHelper
  def reading_status(reading)
    if reading.is_reworked
      "Kandydatura nieaktualna"
    else
      "Kandydatura aktualna"
    end
  end
end
