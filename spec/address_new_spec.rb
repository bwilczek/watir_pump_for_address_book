# frozen_string_literal: true

require_relative 'support/pages/sign_in_page'
require_relative 'support/pages/address_new_page'

RSpec.describe AddressNewPage do
  let(:user) { build(:user) }

  before(:each) do
    SignInPage.open { submit_form(user) }
  end

  specify 'basic flow' do
    AddressNewPage.open do
      expect(self).to be_loaded
    end
  end
end
