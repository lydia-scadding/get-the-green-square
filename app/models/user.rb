require 'json'
require 'open-uri'
require 'active_support/all'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :password, presence: true
  validates :gh_username, presence: true, if: :valid_gh_username?

  def valid_gh_username?
    url = "https://api.github.com/users/#{gh_username}"
    data = JSON.parse(URI.open(url).read)
    errors.add(:gh_username, "must be a valid GitHub username") unless data["login"]
  end

  def work_done
    url = "https://api.github.com/users/lydia-scadding/events"
    data = JSON.parse(URI.open(url).read)
    pushes_today = data.select { |event| event["type"] == 'PushEvent' && event["created_at"].to_datetime > Date.today }
    pushes_today.count
  end
end
