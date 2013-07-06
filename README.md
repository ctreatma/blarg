Blarg
======

A blog application on Rails 4 under Ruby 2, using Kramdown for markdown support.

TODO
=====

- Easier access to admin functionality
- Styling/theming

Installation
=============

1. Install application & dependencies

        git clone git://github.com/ctreatma/blarg.git
        cd blarg
        bundle install
        rake db:migrate

2. Set the `BLARG_SECRET_KEY` environment variable.  It must be at least 30 characters long.

3. Run `rails c` to create the admin user

        u = User.new(email: '<email>', password: '<password>')
        u.name = '<name>'
        u.about_url = '<url to about/home page>' # optional
        u.save
