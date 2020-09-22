module PhoneReservationsHelper
  def valide?(id)
    phone_reservation = PhoneReservation.find(id)
    unless  phone_reservation.line_booked
      true
    else
      false
    end
  end

  def valid(id)
    {true => "◎", false => "×"}[valide?(id)]
  end

end
