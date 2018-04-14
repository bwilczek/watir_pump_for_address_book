# frozen_string_literal: true

require_relative 'base_page'
require_relative '../components/address_list'

class AddressIndexPage < BasePage
  uri '/addresses'
  component :list, AddressList, :table, class: 'table'
end
