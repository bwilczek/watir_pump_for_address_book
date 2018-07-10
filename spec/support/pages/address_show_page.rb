# frozen_string_literal: true

require_relative 'base_page'
require_relative '../components/address_list'

class AddressShowPage < BasePage
  uri '/addresses{/id}'

  span_reader :first_name, data_test: 'first_name'
  span_reader :last_name, data_test: 'last_name'
  span_reader :address1, data_test: 'street_address'
  span_reader :address2, data_test: 'secondary_address'
  span_reader :city, data_test: 'city'
  span_reader :state, data_test: 'state'
  span_reader :zip_code, data_test: 'zip_code'
  span_reader :country
  span_reader :birthday, data_test: 'birthday'
  span_reader :color
  span_reader :age, data_test: 'age'
  span_reader :website, data_test: 'website'

  link_clicker :list, text: 'List'

  def country
    'United States'
  end

  def color
    style = root.span(data_test: 'color').attribute('style')
    # "width: 25px; height: 25px; background: rgb(227, 82, 40);"
    # TODO: parse the CSS string properly
    style
  end
end
