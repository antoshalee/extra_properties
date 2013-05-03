ExtraProperties
===============

ExtraProperties gem simplifies management, storing and validation of dynamic properties of ActiveRecord models.

Consider an online shop application. The central entity of such apps is usually Product. Assume that products may have different sets of properties depending on their category. The classic approach to implement such behaviour is Entity-Attribute-Value model (EAV). However EAV requires additional tables and relations which are difficult to maintain and lead to complex and ineffective SQL-queries.

ExtraProperties' approach is free of EAV model. It offers extra properties storing by means of Postgres [hstore extension](http://www.postgresql.org/docs/9.1/static/hstore.html).
Installation
-------------
First you should setup your database for hstore using. I recommend you to see the corresponding [episode](http://railscasts.com/episodes/345-hstore) of Railscasts. Short excerpt is below.
in your Gemfile:
```ruby
gem 'activerecord-postgres-hstore'
```
in your config/application.rb:
```ruby
config.active_record.schema_format = :sql
```
and finally:
```sh
rails g hstore setup
rake db:migrate
```