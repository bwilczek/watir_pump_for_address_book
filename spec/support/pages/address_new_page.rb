# frozen_string_literal: true

require_relative 'base_page'

class AddressNewPage < BasePage
  uri '/addresses/new'

  text_field :first_name, id: 'address_first_name'
  text_field :last_name, id: 'address_last_name'
  text_field :address1, id: 'address_street_address'
  text_field :address2, id: 'address_secondary_address'
  text_field :city, id: 'address_city'
  select_list :state, id: 'address_state'
  text_field :zip_code, id: 'address_zip_code'
  radio :country, name: 'address[country]'

  def country=(_val)
    # FIXME: radio buttons for country are buggy (HTML)
    country.set
  end
end
