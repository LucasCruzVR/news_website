json.call(@publication, :id, :title, :subtitle, :content, :url_image, :created_at, :updated_at)
json.categories @publication.categories do |category|
    json.call(category, :id, :name)
end