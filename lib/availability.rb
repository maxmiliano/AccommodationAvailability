require "active_support"
require "active_support/core_ext/date/calculations"
require 'active_support/time'

class Availability
  def initialize(db)
    @db = db
  end

  def available_between?(checkin, checkout)

    availabilites = @db[:availabilities]

    availability_big_string = ""
    checkin_months = checkin.year * 12 + (checkin.month - 1)
    checkout_months = checkout.year * 12 + (checkout.month - 1)

    checkin_months.upto(checkout_months) do |month_number|
      year, month = month_number.divmod(12)

      month_availability = availabilites.where(year: year, month: month + 1).first

      if month_availability
        days_availability = month_availability[:days]
        availability_big_string << days_availability.to_s
      else
        # Month availability not found in database, let's assume it's an unavailable month
        return false
      end
    end

    # availability_big_string currently has full months availability
    # we must ignore the days availability from first day of month through checkin day
    remove_before = checkin.day - 1
    availability_big_string = availability_big_string[remove_before..-1]

    # Let's also remove the availability from checkout date -1 through end of month
    remove_after = (checkout.at_end_of_month.day - checkout.day) + 1
    availability_big_string = availability_big_string[0...-remove_after]

    # A single "1" would make the desired dates unavailable
    !availability_big_string.include?("1")
  end
end
