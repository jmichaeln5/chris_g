class Purchaser < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy

   self.per_page = 5
end
