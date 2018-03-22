# frozen_string_literal: true

require_relative 'home_page'

class LoginBasePage < BasePage
  text_field_writer :email, data_test: 'email'
  text_field_writer :password, data_test: 'password'
  input :submit, data_test: 'submit'

  def submit_form(email, password)
    self.email = email
    self.password = password
    submit.click
    HomePage.new(browser).wait_for_loaded
  end
end
