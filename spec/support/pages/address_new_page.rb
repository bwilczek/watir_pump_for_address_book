# frozen_string_literal: true

require_relative 'base_page'

class AddressNewPage < BasePage
  uri '/addresses/new'

  text_field_writer :first_name, id: 'address_first_name'
  text_field_writer :last_name, id: 'address_last_name'
  text_field_writer :address1, id: 'address_street_address'
  text_field_writer :address2, id: 'address_secondary_address'
  text_field_writer :city, id: 'address_city'
  select_writer :state, id: 'address_state'
  text_field_writer :zip_code, id: 'address_zip_code'
  text_field_writer :age, id: 'address_age'
  text_field_writer :website, id: 'address_website'
  # custom writers
  radio_writer :country
  text_field_writer :birthday
  text_field_writer :color

  def country=(c)
    root.input(id: 'address_country_true').click
  end

  def birthday=(b)
    root.date_field(id: 'address_birthday').set b
  end

  def color=(c)
    browser.execute_script "$('#address_color').val('##{c}')"
  end
end
