# frozen_string_literal: true

require_relative 'address_list_item'
require_relative 'address_list_item_collection'

class AddressList < WatirPump::Component
  thead :header
  components :items, AddressListItem, -> { root.tbody.trs }
  decorate :items, AddressListItemCollection
end
