module EventsHelper
  def set_event day, events
    event_days = events.pluck(:start_time).map {|d| d.to_date }
    if event_days.include?(day)
      "match-day"
    else
      ""
    end
  end

  def set_event_id day, events
    id = ""

    events.each do |event|
      if event.start_time.to_date == day
        id = event.id
        break
      end
    end

    id
  end
end
