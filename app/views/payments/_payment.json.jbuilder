json.extract! payment, :id, :order_id, :payment_method, :total_amount_id, :payment_status, :created_at, :updated_at
json.url payment_url(payment, format: :json)
