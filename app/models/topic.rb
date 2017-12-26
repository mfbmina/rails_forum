class Topic < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy

  validates :subject, presence: true

  accepts_nested_attributes_for :posts

  scope :like, ->(query) { where("subject ILIKE ?", "%#{query}%") }
end
