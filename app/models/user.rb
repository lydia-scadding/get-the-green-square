require 'json'
require 'open-uri'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :password, presence: true
  validates :gh_username, presence: true, if: :username_exists?

  def username_exists?
    url = "https://api.github.com/users/#{gh_username}"
    data = JSON.parse(URI.open(url).read)
    errors.add(:gh_username, "must be a valid GitHub username") unless data["login"]
  end
end
