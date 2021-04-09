require 'json'
require 'net/http'
require 'active_support/all'

class User < ApplicationRecord
  BASE_URL = "https://api.github.com/users/"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :gh_username, presence: true

  validate :valid_gh_username?

  after_create :set_img_url

  def work_done
    url = "#{BASE_URL}#{gh_username}/events"
    data = JSON.parse(URI.open(url).read)
    pushes_today = data.select { |event| event["type"] == 'PushEvent' && event["created_at"].to_datetime > Date.today }
    pushes_today.count
  end

  private

  def valid_gh_username?
    url = URI.parse("#{BASE_URL}#{gh_username}")
    req = Net::HTTP.new(url.host, url.port)
    req.use_ssl = true
    res = req.request_head(url.path)
    errors.add(:gh_username, "must be a valid GitHub username") if res.code == '404'
  end

  def set_img_url
    url = "#{BASE_URL}#{gh_username}"
    data = JSON.parse(URI.open(url).read)
    update_attributes(img_url: data["avatar_url"])
  end
end
