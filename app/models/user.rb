require 'json'
require 'open-uri'
require 'active_support/all'

class User < ApplicationRecord
  BASE_URL = "https://api.github.com/users/"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :password, :gh_username, presence: true

  after_validation :valid_gh_username?

  before_create :set_image

  def work_done
    url = "#{BASE_URL}#{gh_username}/events"
    data = JSON.parse(URI.open(url).read)
    pushes_today = data.select { |event| event["type"] == 'PushEvent' && event["created_at"].to_datetime > Date.today }
    pushes_today.count
  end

  private

  def valid_gh_username?
    #TODO
    # url = "#{BASE_URL}#{gh_username}"
    # data = JSON.parse(URI.open(url).read)
    # errors.add(:gh_username, "must be a valid GitHub username") unless data["login"]
  end

  def set_image
    #TODO
  end
end
