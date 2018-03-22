# frozen_string_literal: true

require_relative 'support/pages/home_page'
require_relative 'support/pages/sign_in_page'

RSpec.describe HomePage do
  describe TopMenu do
    context 'when not logged in' do
      specify 'guest buttons are there' do
        HomePage.open do
          expect(top_menu).to be_visible
          expect(top_menu.home_link).to be_visible
          expect(top_menu.sign_in_link).to be_visible
          expect(top_menu.sign_out_link).not_to be_present
          expect(top_menu.addresses_link).not_to be_present
        end
      end
    end

    context 'when logged in' do
      specify 'user buttons are there' do
        SignInPage.open do
          submit_form('bwilczek@example.com', 'example')
        end
        HomePage.open do
          expect(top_menu).to be_visible
          expect(top_menu.home_link).to be_visible
          expect(top_menu.sign_in_link).not_to be_present
          expect(top_menu.sign_out_link).to be_visible
          expect(top_menu.addresses_link).to be_visible
        end
      end
    end
  end
end
