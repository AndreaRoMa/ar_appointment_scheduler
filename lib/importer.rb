require 'csv'

class Importer
  class << self
    def from_csv(path)
      counter = 0
      CSV.foreach(path, headers: true, return_headers: false,
                        header_converters: :symbol, converters: :all) do |row|
        ActiveRecord::Base.transaction do
        
          coach = Coach.find_or_create_by!(name: row[:name])

          day_of_week = Availability::DAYS_OF_WEEK.index(row[:day_of_week])
          start_time = row[:available_at].strip
          finish_time = row[:available_until].strip

          availability = coach.availabilities.create!(day_of_week: day_of_week,
                                                      start: start_time, end: finish_time)

          slots_array = Slot.new.generate_time_slots(start_time: start_time, finish_time: finish_time)

          slots_array.map { |slot_time| Slot.create!(availability: availability, start: slot_time) }

          counter += 1
        end
      end

      counter
    end
  end
end
