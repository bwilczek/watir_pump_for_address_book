# frozen_string_literal: true

RSpec.describe AddressShowPage do
  let(:user) { build(:user) }
  let(:address) { build(:address) }

  before(:each) do
    SignInPage.open { fill_form!(user) }
    Api.login(user)
    Api.create_address(address)
  end

  after(:each) do
    Api.delete_last_address
  end

  specify 'basic flow with showing' do
    AddressIndexPage.open { list.items[address.last_name].show }
    AddressShowPage.use { expect(form_data).to eq address.to_h }
  end
end
