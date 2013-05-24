# Durango Coders RubyMotion Demo

This app was developed during a live demo to the Durango Coders about RubyMotion. The goal of the talk
was to show how RubyMotion can integrate directly with ObjectiveC, but RubyMotion wrappers allow developers
to create the same app with much less code.

This app shows the Durango Coders membership list by using the Meetup.com API (http://www.meetup.com/meetup_api/docs/2/groups/).

The slides from the presentation are available here: http://aaronrenner.github.io/durango-coders-rubymotion-presentation/

## Running the app
1. Install rubymotion and XCode
2. Get your Meetup.com API Key (http://www.meetup.com/meetup_api/key/)
3. Run the app with the following commands

        bundle  #installs dependencies
        bundle exec rake MEETUP_API_KEY=<Your Meetup API key>


  Note: You can also create a .env file in the project root that contains your Meetup API Key

        echo "MEETUP_API_KEY=<Your Meetup API Key>" >> .env     
        bundle exec rake
