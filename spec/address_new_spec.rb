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
      first_name.set address.first_name
      last_name.set address.last_name
      address1.set address.address1
      address2.set address.address2
      city.set address.city
      state.select address.state
      zip_code.set address.zip_code
      self.country = address.country
      birthday.set address.birthday
      age.set address.age
      website.set address.website
      # binding.pry
      # color.set address.color
      # expect(self).to be_loaded
    end
  end
end
