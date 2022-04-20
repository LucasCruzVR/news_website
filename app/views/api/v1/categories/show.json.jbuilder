json.array! @categories do |category|
  json.call(category, :id, :name, :created_at, :updated_at)
end
