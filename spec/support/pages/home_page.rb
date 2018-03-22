# frozen_string_literal: true

require_relative 'base_page'

class HomePage < BasePage
  uri '/'
  h1 :title, text: 'Welcome to Address Book'
  query :loaded?, -> { title.visible? }
end
