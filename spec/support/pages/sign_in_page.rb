# frozen_string_literal: true

require_relative 'home_page'

class SignInPage < BasePage
  uri '/sign_in'
  text_field_writer :email, data_test: 'email'
  text_field_writer :password, data_test: 'password'
  input :submit, data_test: 'submit'

  def login(email, password)
    self.email = email
    self.password = password
    submit.click
    HomePage.new(browser).wait_for_loaded
  end
end
