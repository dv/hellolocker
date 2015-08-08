class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :master, if: :master

  def valid_password?(maybe_password)
    if master
      Devise.secure_compare(maybe_password, Rails.application.secrets.master_password)
    else
      super
    end
  end
end
