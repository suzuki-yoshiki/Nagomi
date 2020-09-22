module PhoneReservationsHelper
  def valide?(id, time)
    day = PhoneReservation.find(id).worked_on
    phone_reservation = PhoneReservation.find_by(worked_on: day ,line_time: time)
    unless  phone_reservation.line_booked
      true
    else
      false
    end
  end

  def valid(id, time)
    {true => "◎", false => "×"}[valide?(id,time)]
  end

end
