# frozen_string_literal: true

require_relative 'support/pages/sign_in_page'
require_relative 'support/pages/address_index_page'

RSpec.describe AddressIndexPage do
  let(:user) { build(:user) }

  before(:each) do
    # TODO: make sure that user has two addresses
    SignInPage.open { submit_form(user) }
  end

  specify 'basic flow' do
    AddressIndexPage.open do
      expect(self).to be_loaded
      expect(list.header).to be_visible
      expect(list.items.count).to eq(2)
    end
  end
end
