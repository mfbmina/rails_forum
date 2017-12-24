class Topic < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy

  validates :subject, presence: true

  accepts_nested_attributes_for :posts
end
