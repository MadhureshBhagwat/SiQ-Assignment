# frozen_string_literal: true

# define User model class
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :city, :address, presence: true

  has_many :posts
  has_many :comments

  def full_name(id)
    first_name = User.find(id).first_name
    last_name = User.find(id).last_name
    "#{first_name} #{last_name}"
  end
end
