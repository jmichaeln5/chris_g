class Order < ApplicationRecord
  belongs_to :purchaser

  validates :name, presence: true
  validates :vendor, presence: true
  validates :amount, presence: true
  validates :content, presence: true

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |order|
        csv << order.attributes.values_at(*column_names)
      end
    end
  end

  # self.per_page = 2
end
