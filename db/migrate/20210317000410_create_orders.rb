class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :vendor
      t.string :content
      t.integer :amount
      t.integer :po_number
      t.datetime :date_recieved
      t.datetime :date_delivered
      t.string :distributed_by
      t.references :purchaser, null: false, foreign_key: true

      t.timestamps
    end
  end
end
