# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ActiveRecord::Base
  # attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password

  has_many :tweets

  validates :email, uniqueness: true
  validates :password, presence: true, confirmation: true, on: :create
end
