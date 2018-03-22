# frozen_string_literal: true

class TopMenu < WatirPump::Component
  a :home_link, data_test: 'home'
  a :sign_in_link, data_test: 'sign-in'
  a :sign_out_link, data_test: 'sign-out'
  a :addresses_link, data_test: 'addresses'
end
