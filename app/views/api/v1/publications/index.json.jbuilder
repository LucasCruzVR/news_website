json.array! @publications do |publication|
  json.call(publication, :id, :title, :subtitle, :url_image)
end