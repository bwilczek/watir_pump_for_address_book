# frozen_string_literal: true

RSpec.describe AddressNewPage do
  let(:user) { build(:user) }
  let(:address) { build(:address) }

  before(:each) do
    SignInPage.open { submit_form(user) }
  end

  specify 'basic flow' do
    address_cnt = nil
    AddressIndexPage.open { address_cnt = list.items.count }
    AddressNewPage.open { fill_form!(address) }
    AddressIndexPage.open { expect(list.items.count).to eq(address_cnt+1) }
  end
end
