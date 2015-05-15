json.array!(@insertions) do |insertion|
  json.extract! insertion, :id, :price, :magazine_id, :issue_id
  json.url insertion_url(insertion, format: :json)
end
