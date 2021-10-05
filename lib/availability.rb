class Availability
  def initialize(db)
    @db = db
  end

  def available_between?(checkin, checkout)
    true
  end
end
