class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if !enough_tickets? &&
      !tall_enough?
      "Sorry. #{not_enough_tickets} #{not_tall_enough}"
    elsif !enough_tickets?
      "Sorry. #{not_enough_tickets}"
    elsif !tall_enough?
      "Sorry. #{not_tall_enough}"
    else
      self.user.update(
        tickets: take_tickets,
        nausea: increase_nausea,
        happiness: increase_happiness
      )
      "Thanks for riding the #{self.attraction.name}!"
    end
  end

  def take_tickets
    self.user.tickets -= self.attraction.tickets
  end

  def increase_happiness
    self.user.happiness += self.attraction.happiness_rating
  end

  def increase_nausea
    self.user.nausea += self.attraction.nausea_rating
  end

  def enough_tickets?
    self.user.tickets > self.attraction.tickets
  end

  def tall_enough?
    self.user.height > self.attraction.min_height
  end

  def not_enough_tickets
    "You do not have enough tickets to ride the #{attraction.name}."
  end

  def not_tall_enough
    "You are not tall enough to ride the #{attraction.name}."
  end

end
