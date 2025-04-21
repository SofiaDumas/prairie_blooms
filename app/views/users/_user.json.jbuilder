json.extract! user, :id, :name, :email, :street, :city, :postal_code, :province, :created_at, :updated_at
json.url user_url(user, format: :json)
