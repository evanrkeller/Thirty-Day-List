Given /^I wait (\d+) days$/ do |days|
  Delorean.time_travel_to Time.zone.now.to_date + days.to_i.day
end
