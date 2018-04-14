# frozen_string_literal: true

require_relative 'address_list_item'

class AddressList < WatirPump::Component
  thead :header
  components :items, AddressListItem, -> { root.tbody.trs }
end
