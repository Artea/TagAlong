json.array!(@events) do |event|
  json.extract! event, :id, :name, :description, :when, :where, :attend
  json.url event_url(event, format: :json)
end
