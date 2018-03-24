# frozen_string_literal: true

require_relative '../pages/sign_up_page'

module UserHelper
  class << self
    def create_suite_user
      user = FactoryBot.build(:user)
      SignUpPage.open do
        submit_form(user)
      end
      WatirPump.config.browser.cookies.clear
      WatirPump.config.browser.goto('about:blank')
    end
  end
end
