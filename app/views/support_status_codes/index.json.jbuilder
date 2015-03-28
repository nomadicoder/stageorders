json.array!(@support_status_codes) do |support_status_code|
  json.extract! support_status_code, :id, :sequence, :short_code, :description
  json.url support_status_code_url(support_status_code, format: :json)
end
