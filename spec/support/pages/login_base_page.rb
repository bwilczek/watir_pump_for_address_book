# frozen_string_literal: true

require_relative 'home_page'

class LoginBasePage < BasePage
  text_field_writer :email, data_test: 'email'
  text_field_writer :password, data_test: 'password'
  button_clicker :submit, data_test: 'submit'
end
