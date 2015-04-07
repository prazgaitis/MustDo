json.array!(@mustdo_lists) do |mustdo_list|
  json.extract! mustdo_list, :id, :title, :category, :description
  json.url mustdo_list_url(mustdo_list, format: :json)
end
