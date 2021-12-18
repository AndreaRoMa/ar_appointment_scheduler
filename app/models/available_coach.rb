class AvailableCoach < ApplicationRecord
  belongs_to :schedule
  require 'csv'
  
  NOMBRE_ARCHIVO = "AvailableTime.csv"

  class Choach
    attr_reader :name, :day_of_week, :available_at, :available_until

     def initialize(name, day_of_week, available_at, available_until )
      @name = name
      @day_of_week = day_of_week
      @available_at = available_at
      @available_until = available_until
    end
  end
end
