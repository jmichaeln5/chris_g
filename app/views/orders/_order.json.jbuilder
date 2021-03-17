json.extract! order, :id, :name, :vendor, :content, :amount, :po_number, :date_recieved, :date_delivered, :distributed_by, :purchaser_id, :created_at, :updated_at
json.url order_url(order, format: :json)
