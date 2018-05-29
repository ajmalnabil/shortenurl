class Site < ApplicationRecord
  before_save { self.url = url.downcase }
  VALID_URL_REGEX = /\A(?:(?:http|https):\/\/)?([-a-zA-Z0-9.]{2,256}\.[a-z]{2,4})\b(?:\/[-a-zA-Z0-9@,!:%_\+.~#?&\/\/=]*)?\z/
  validates :url, presence: true, format: { with: VALID_URL_REGEX }, uniqueness: true
end
