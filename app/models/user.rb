class User < ApplicationRecord
  has_many :attendances
  has_many :events, through: :attendances

  has_many :participants, foreign_key: 'participant_id', class_name: "Event"
  has_many :admins, foreign_key: 'admin_id', class_name: "Event"

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end