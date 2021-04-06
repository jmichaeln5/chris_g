# == Schema Information
#
#  Table name: purchasers
#
#  t.string "name"
#  t.bigint "user_id", null: false
#  t.datetime "created_at", precision: 6, null: false
#  t.datetime "updated_at", precision: 6, null: false
#  t.index ["user_id"], name: "index_purchasers_on_user_id"

class Purchaser < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy

  # self.per_page = 5
end
