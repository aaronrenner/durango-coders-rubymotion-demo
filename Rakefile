# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'bundler'
Bundler.require
Dotenv.load

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'durango_coders'

  app.pods do
    pod "SDWebImage"
  end

  app.info_plist["MeetupAPIKey"] = ENV.fetch("MEETUP_API_KEY"){raise "MEETUP_API_KEY environment variable is required"}
  app.info_plist["MeetupGroupId"] = 4280402 #Durango Coders
end
