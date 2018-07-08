# frozen_string_literal: true

require 'watir_pump'
require 'regexp-examples'

require_relative './factory_bot_rspec'
require_relative '../factories/users'
require_relative '../factories/addresses'
require_relative '../helpers/api'
require_relative '../helpers/user'

Dir.glob("#{__dir__}/../../support/**/*.rb", &method(:require))

Api.base_url = 'http://a.testaddressbook.com'

RSpec.configure do |config|
  config.define_derived_metadata(file_path: %r{/spec/}) do |meta|
    meta[:aggregate_failures] = true
    meta[:watir] = true
  end

  config.before(:suite) do
    Watir.default_timeout = 10
    WatirPump.configure do |c|
      c.browser = Watir::Browser.new
      c.browser.window.resize_to(1200, 800)
      c.base_url = Api.base_url
    end

    if ENV['TEST_USER_EMAIL']
      WatirPump.config.current_user_email = ENV['TEST_USER_EMAIL']
    else
      UserHelper.create_suite_user
    end
  end

  config.before(:each) do |example|
    WatirPump.config.current_example = example
  end

  config.after(:each, watir: true) do
    WatirPump.config.browser.cookies.clear
    WatirPump.config.browser.goto('about:blank')
  end
end
