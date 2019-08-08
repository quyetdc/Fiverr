class Offer < ApplicationRecord
  belongs_to :request
  belongs_to :user

  has_many :reviews

  enum status: [:pending, :accepted, :rejected]
  validates :amount, :days, numericality: { only_integer: true, message: "Must be a number" }
end
