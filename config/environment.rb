# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Homegame::Application.initialize!

Time::DATE_FORMATS[:game_date_option] = "%A, %b %d"