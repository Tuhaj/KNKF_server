# at_hotel = true 
# email = if at_hotel
#   "why@hotelambrose.com" 
# else
#   "why@drnhowardcham.com" 
# end

at_hotel = false
# email = if at_hotel 
#   address = "why"
#   address << "@hotelambrose"
#   address << ".com" 
# end
# puts email

print(if at_hotel.nil?
        "No clue if he's in the hotel."
      elsif at_hotel == true 
        "Definitely in."
      elsif at_hotel == false 
        "He's out."
      else
        "The system is on the freee-itz." 
      end)