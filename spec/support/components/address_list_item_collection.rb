# frozen_string_literal: true

class AddressListItemCollection < WatirPump::ComponentCollection
  def [](last_name)
    find { |l| l.last_name == last_name }
  end
end
