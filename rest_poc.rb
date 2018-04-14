# frozen_string_literal: true

unless ENV['TEST_USER_EMAIL']
  warn 'This script requires TEST_USER_EMAIL env variable'
  exit 1
end

require 'faraday'
require 'faraday-cookie_jar'
require 'nokogiri'
require 'pry'
require 'json'

BASE_URL = 'http://a.testaddressbook.com'

conn = Faraday.new(url: BASE_URL) do |builder|
  builder.use :cookie_jar
  builder.adapter Faraday.default_adapter
end

body = conn.get('/sign_in').body
doc = Nokogiri::HTML(body)
token = doc.xpath('//input[@name="authenticity_token"]/@value').text

conn.post do |req|
  req.url '/session'
  req.params['authenticity_token'] = token
  req.params['session[email]'] = ENV['TEST_USER_EMAIL']
  req.params['session[password]'] = 'example'
end

puts JSON.parse(conn.get('/addresses.json').body)
