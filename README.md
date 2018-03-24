This is a demo test suite for [Address Book](http://a.testaddressbook.com) application implemented using `watir_pump` library.

Use environment variable `TEST_USER_EMAIL` to specify email address of the existing application user
to be used as a default one in the test suite. Without it a new user will be signed up for every test suite execution.

```bash
# install dependencies
bundle install

# run specs
bundle exec rspec

# run code inspections
bundle exec rubocop
```
