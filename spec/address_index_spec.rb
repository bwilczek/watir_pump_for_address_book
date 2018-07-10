# frozen_string_literal: true

RSpec.describe AddressIndexPage do
  let(:user) { build(:user) }

  before(:each) do
    SignInPage.open { fill_form!(user) }
  end

  specify 'basic flow' do
    AddressIndexPage.open do
      expect(self).to be_loaded
      expect(list.header).to be_visible
    end
  end
end
