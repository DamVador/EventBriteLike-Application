class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances

  has_many :participants, class_name: "User"
  belongs_to :admin, class_name: "User"

  validates :duration, presence: true,
    numericality: { greater_than: 0 }

  validates :title, presence: true,
    length: { in: 5..140 }

  validates :description, presence: true,
    length: { in: 20..1000 }

  validates :price, presence: true,
    numericality: { greater_than: 0}
     #numericality: {less_than_or_equal_to: 1000}

  validates :location, presence: true

  has_one_attached :event_image

end
