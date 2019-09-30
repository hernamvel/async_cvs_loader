# Async CSV loader

General Demo to show my skills in Rails. This app has a page
that receives an identifer an a well formed CSV file and when clicking
at the submit button, it will process it asynchronously rendering the final
result to the user.

## What was used

To build this app I used:

- Ruby 2.5.3
- Rails 5.2.3
- Postgresql (any recent version will work)
- Sidekiq (for ActionJob)
- Redis (for ActionJob/Sidekiq and ActionCable)

And from Rails:

- Unobstructive javascript
- ActionJob/Sidekiq for asynchronous processing
- ActionCable for asynchronous reporting
- RSpec for testing and SimpleCov for coverage report
- Twitter Bootstrap (didn't want to render just plain pages)

## Instructions

- Clone this repo:

```
git clone https://github.com/hernamvel/async_cvs_loader.git
```

- From the root of this repo, run bundle install

bundle install

- From the root of this repo, run:

```
rails s
```

and for Sidekiq

```
bundle exec sidekiq -c 2 -v -q default
```

Alternatively, you can run foreman if you want (I tested separately though).

- To run the tests, from the root of this repo run:

```
rspec
```

You will find a 96.88% coverage as reported by SimpleCov, just filtering a 
couple of action_cable files.

If you need a well formed CSV to test the app manually, you can take
this one: spec/fixtures/files/valid.csv

## Use the app in Heroku

This app is deployed in heroku and you can access it from:

https://asynccsv.herokuapp.com/

As this is deployed on a Herolu's free tier, please allow a couple
of seconds for the app and websockets to 'warm up' on the first request.

## Code quality

Before submitting, I ran RuboCop over this code removing most of the warnings/weak warnings 
reported (at least all the ones I agree with).

## Problems / Feedback:

Don't hesitate to contact me at hernamvel@gmail.com

