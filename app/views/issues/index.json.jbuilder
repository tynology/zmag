json.array!(@issues) do |issue|
  json.extract! issue, :id, :title, :cover, :printdate
  json.url issue_url(issue, format: :json)
end
