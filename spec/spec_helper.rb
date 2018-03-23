# frozen_string_literal: true

require 'watir_pump'
require 'regexp-examples'
require_relative 'support/factory_bot'
require_relative 'support/factories/users'
require_relative 'support/helpers/user'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.define_derived_metadata(file_path: %r{/spec/}) do |meta|
    meta[:aggregate_failures] = true
    meta[:watir] = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.disable_monkey_patching!
  config.warnings = false

  config.default_formatter = 'doc' if config.files_to_run.one?

  # config.profile_examples = 10

  config.order = :random
  Kernel.srand config.seed

  config.before(:suite) do
    Watir.default_timeout = 10
    WatirPump.configure do |c|
      c.browser = Watir::Browser.new
      c.browser.window.resize_to(1200, 800)
      c.base_url = 'http://a.testaddressbook.com'
    end
    # UserHelper.create_suite_user
  end

  config.before(:each) do |example|
    WatirPump.config.current_example = example
  end

  config.after(:each, watir: true) do
    WatirPump.config.browser.cookies.clear
    WatirPump.config.browser.goto('about:blank')
  end
end
