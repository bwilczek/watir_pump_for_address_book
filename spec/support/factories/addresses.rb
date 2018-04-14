# frozen_string_literal: true

FactoryBot.define do
  factory :address, class: OpenStruct do
    first_name FFaker::Name.first_name
    last_name FFaker::Name.last_name
    address1 FFaker::Address.street_address
    address2 FFaker::Address.secondary_address
    city FFaker::Address.city
    state FFaker::AddressUS.state_abbr
    zip_code FFaker::AddressUS.zip_code
    country 'United States'
  end
end
