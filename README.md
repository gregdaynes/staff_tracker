# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Staff Tracker
=============

User should be able to create new staff members, enter basic details, and update their information as necessary. Eventually, everyone leaves, so deleting staff is required.

- [ ] Rails
- [ ] - [Rails Guides](guides.rubyonrails.org/getting_started.html)
- [ ] [RSpec](http://rspec.info)
- [ ] CRUD
- [ ] REST

```
Person
  gender
    string to allow non-binary genders o_O 
  height
    float
    metric
  weight
    float
    metric
  dob
    date
  first_name
    string
  last_name
    string
  middle_name
    string

Staff < Person
  skills
  pod
  role
  start_date
```

