module PhoneReservationsHelper
  def valide?(id)
    phone_reservation = PhoneReservation.find(id)
    unless  phone_reservation.line_booked || phone_reservation.holiday
      true
    else
      false
    end
  end
end
