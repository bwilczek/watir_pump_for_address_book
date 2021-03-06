# frozen_string_literal: true

require 'faraday'
require 'faraday-cookie_jar'
require 'nokogiri'
require 'pry'
require 'json'

module Api
  class << self
    attr_accessor :base_url

    def create_user(user)
      token = authenticity_token('/sign_up')
      conn.post do |req|
        req.url '/users'
        req.params['authenticity_token'] = token
        req.params['user[email]'] = user.email
        req.params['user[password]'] = user.password
      end
    end

    def create_address(address)
      raise 'Need to login first' unless @current_user
      response = conn.post do |req|
        req.url '/addresses.json'
        req.headers['Content-Type'] = 'application/json'
        req.body = address.to_h.to_json
      end
      @last_address_id = JSON.parse(response.body)['id'].to_i
    end

    def delete_last_address
      raise 'Need to login first' unless @current_user
      response = conn.delete do |req|
        req.url "/addresses/#{@last_address_id}"
        req.headers['Content-Type'] = 'application/json'
      end
      @last_address_id = nil
    end

    def login(user)
      token = authenticity_token('/sign_in')
      response = conn.post do |req|
        req.url '/session'
        req.params['authenticity_token'] = token
        req.params['session[email]'] = user.email
        req.params['session[password]'] = user.password
      end
      @current_user = user if response.status < 400
    end

    def addresses
      raise 'Need to login first' unless @current_user
      JSON.parse(conn.get('/addresses.json').body)
    end

    private

    def authenticity_token(uri)
      body = conn.get(uri).body
      doc = Nokogiri::HTML(body)
      doc.xpath('//input[@name="authenticity_token"]/@value').text
    end

    def conn
      @conn ||= Faraday.new(url: base_url) do |builder|
        builder.use :cookie_jar
        builder.adapter Faraday.default_adapter
      end
    end
  end
end
