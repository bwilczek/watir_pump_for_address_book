# frozen_string_literal: true

require_relative 'support/pages/sign_in_page'
require_relative 'support/pages/address_new_page'

RSpec.describe AddressNewPage do
  let(:user) { build(:user) }
  let(:address) { build(:address) }

  before(:each) do
    SignInPage.open { submit_form(user) }
  end

  specify 'basic flow' do
    AddressNewPage.open do
      fill_form(address)
    end
  end
end
