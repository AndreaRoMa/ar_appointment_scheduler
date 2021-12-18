json.extract! available_coach, :id, :name, :day_of_week, :available_at, :available_until, :schedule_id, :created_at, :updated_at
json.url available_coach_url(available_coach, format: :json)
