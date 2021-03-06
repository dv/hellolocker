# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  master                 :boolean          default(FALSE)
#

FactoryGirl.define do
  sequence :email do |n|
    "my-#{n.ordinalize}-favorite-person@example.com"
  end

  factory :user do
    email
    password "password"

    factory :master do
      master true
    end
  end
end
