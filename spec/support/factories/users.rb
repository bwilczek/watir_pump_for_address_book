# frozen_string_literal: true

FactoryBot.define do
  factory :predefined_user, class: OpenStruct do
    email 'bwilczek@example.com'
    password 'example'
  end

  factory :suite_user, class: OpenStruct do
    email { WatirPump.config.current_user_email ||= "#{FFaker::Internet.user_name}_#{Time.now.to_i}_#{/[a-z]{3}/.random_example}@#{FFaker::Internet.domain_name}" }
    password 'example'
  end
end
