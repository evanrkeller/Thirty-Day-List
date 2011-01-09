# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ThirtyDayList::Application.initialize! do |config|
  config.time_zone = 'Eastern Time (US & Canada)'
end
