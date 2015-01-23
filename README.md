Tibetanflashcards
================

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

This application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).

Rails Composer is open source and supported by subscribers. Please join RailsApps to support development of Rails Composer.

Problems? Issues?
-----------

Need help? Ask on Stack Overflow with the tag 'railsapps.'

Your application contains diagnostics in the README file. Please provide a copy of the README file when reporting any issues.

If the application doesn't work as expected, please [report an issue](https://github.com/RailsApps/rails_apps_composer/issues)
and include the diagnostics.

Ruby on Rails
-------------

This application requires:

- Ruby 2.1.5
- Rails 4.2.0

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Getting Started
---------------

Documentation and Support
-------------------------

For DreamHost support see:

http://wiki.dreamhost.com/Ruby_on_Rails
http://rails.dreamhosters.com/
http://adamish.com/blog/archives/775

To change to mysql support, modify config/database.yml to change from postgresql adapter to mysql at least for production and see instructions from http://wiki.dreamhost.com/Ruby_on_Rails:

production:
  adapter:  mysql2
  host:     localhost
  encoding: unicode
  database: nameofdatabase
  pool:     5
  username: databaseusername  
  password: databasepassword

Also find the line "gem 'pg'" in the Gemfile file and change to "gem 'mysql2'"

Assuming Ruby installation has been done, just run (in shell):

bundle install

After that's done:

rake db:setup

This will set up your database and use the seed file to populate the database.

Then you'll need to compile the assets:

rake assets:precompile

To change the background, replace the background.jpg file in at app/assets/images/background.jpg. You can also modify it via CSS at app/assets/stylesheets/application.css.scss. You may need to re-run the asset compile command above.

Issues
-------------

Similar Projects
----------------

Contributing
------------

Credits
-------

License
-------
