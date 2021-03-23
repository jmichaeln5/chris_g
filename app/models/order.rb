class Order < ApplicationRecord
  belongs_to :purchaser

  # self.per_page = 2
end
