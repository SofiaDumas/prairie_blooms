json.extract! store, :id, :name, :description, :logo_url, :contact_email, :phone, :created_at,
              :updated_at
json.url store_url(store, format: :json)
