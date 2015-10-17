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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  if SingleUserMode.enabled?
    # In Single User mode Devise doesn't need an email for the strategy to become valid
    # nor does anyone need to register.
    devise :database_authenticatable,
      :recoverable, :rememberable, :trackable, :validatable, authentication_keys: {email: false}
  else
    devise :database_authenticatable,
      :recoverable, :rememberable, :trackable, :validatabled, :registerable
  end

  has_many :items

  validates_uniqueness_of :master, if: :master

  def valid_password?(maybe_password)
    if master
      Devise.secure_compare(maybe_password, Rails.application.secrets.master_password)
    else
      super
    end
  end

  def self.find_first_by_auth_conditions(*)
    if SingleUserMode.enabled?
      SingleUserMode.master_user
    else
      super
    end
  end

private

  def password_required?
    !master && super
  end

  def email_required?
    !master && super
  end

end
