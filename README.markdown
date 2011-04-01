sort_out
==============

sort_out provides automatic and configurable order for ActiveRecord.

Installation
------------

You can use sort_out as a gem in Rails 3.

To use the gem version, put the following gem requirement in your `Gemfile`:

    gem "sort_out"


Usage
-----

To use sort_out you need to configure in your model:

    sortable :default_column => 'deadline', :after => [[:deadline, :desc]],
      :by => [ :deadline, :code, [:customer, 'people.name'] ]

* default_column: the column that will be used when there is nothing explicited. (default: name)
* after: is the second order that will de done (Example: "... order by name, done_at desc") (default: [])
* by: is the fields that you want to allow the user to order (default: nil)

### Compatibility

* Rails 3.0.4 in Ruby 1.8.7 and Ruby 1.9.2

### License
MIT License. Copyright 2011 29sul Tecnologia da Informação <http://www.29sul.com.br/>
