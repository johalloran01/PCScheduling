class User < ApplicationRecord
  has_secure_password

  has_many :user_availabilities, dependent: :destroy
  has_many :time_slots, through: :user_availabilities
  has_many :session_memberships, dependent: :destroy
  has_many :sessions, through: :session_memberships

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :time_zone, presence: true, inclusion: { in: ActiveSupport::TimeZone.all.map(&:name) }

  before_save :set_default_timezone

  private

  def set_default_timezone
    self.time_zone ||= "UTC"
  end
end
