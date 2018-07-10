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
  span_reader :website, data_test: 'website'
  # custom readers: some extra processing required
  span_reader :country
  span_reader :birthday
  span_reader :color
  span_reader :age

  link_clicker :list, text: 'List'

  def country
    'United States'
  end

  def age
    root.span(data_test: 'age').text.to_i
  end

  def birthday
    # mm/dd/yyyy => dd/mm/yyyy
    date = root.span(data_test: 'birthday').text
    Date.strptime(date, '%m/%d/%Y').strftime('%d/%m/%Y')
  end

  def color
    style = root.span(data_test: 'color').attribute('style')
    rgb2hex(parse_css(style)[:background])
  end

  private

  def parse_css(css)
    # "width: 25px; height: 25px; background: rgb(227, 82, 40);"
    ret = {}
    css.split(';').each do |kv|
      k, v = kv.strip.split(':')
      ret[k.strip.to_sym] = v.strip
    end
    ret
  end

  def rgb2hex(rgb)
    r, g, b = rgb.split(',')
    r.gsub!(/\D/, '').to_i
    g.gsub!(/\D/, '').to_i
    b.gsub!(/\D/, '').to_i
    format('%2x%2x%2x', r, g, b)
  end
end
