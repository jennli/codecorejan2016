class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :apartment_listing

  validates :checkin_date, presence: :true

  validates :checkout_date, presence: :true

  validate :dates_are_avaialble

  validate :checkout_date_is_after_checkin_date

  def reserved_dates
    checkin_date...checkout_date
  end

  def checkout_date_is_after_checkin_date
    if checkout_date - checkin_date <= 0
      errors.add(:checkout_date, "must be later than check in date!")
    end
  end

  def dates_are_avaialble
    apartment_listing.reservations.each do |r|
      byebug
      if (checkin_date - r.checkout_date) * (r.checkin_date - checkout_date) > 0
        if(checkin_date - r.checkin_date > 0)
          errors.add(:checkin_date, "not avaialbe!")
        else
          errors.add(:checkout_date, "not avaiable!")
        end
      end
    end
  end

end
