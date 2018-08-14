json.extract! storage, :id, :name, :memo, :type_id, :parent_id, :created_at, :updated_at
json.url storage_url(storage, format: :json)
