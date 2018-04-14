# frozen_string_literal: true

require_relative '../helpers/api'

module UserHelper
  class << self
    def create_suite_user
      user = FactoryBot.build(:user)
      Api.create_user(user)
    end
  end
end
