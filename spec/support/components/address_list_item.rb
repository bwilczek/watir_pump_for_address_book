# frozen_string_literal: true

require_relative 'address_list_item'

class AddressListItem < WatirPump::Component
  td_reader :first_name, -> { root.tds[0] }
  td_reader :last_name, -> { root.tds[1] }
  td_reader :city, -> { root.tds[2] }
  td_reader :state, -> { root.tds[3] }
  link_clicker :show, -> { root.link(text: 'Show') }
  link_clicker :edit, -> { root.link(text: 'Edit') }
  link_clicker :destroy

  def destroy
    root.link(text: 'Destroy').click
    browser.alert.ok
  end
end
