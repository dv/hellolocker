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
