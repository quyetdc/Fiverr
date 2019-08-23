class Transaction < ApplicationRecord
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :seller, class_name: "User", optional: true
  belongs_to :gig, optional: true
  belongs_to :request, optional: true

  enum status: %i[approved pending rejected]
  enum transaction_type: %i[trans withdraw]
  enum source_type: %i[system stripe]

end
