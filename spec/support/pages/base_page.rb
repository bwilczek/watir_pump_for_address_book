# frozen_string_literal: true

require_relative '../components/top_menu'

class BasePage < WatirPump::Page
  component :top_menu, TopMenu, :div, id: 'navbar'
end
