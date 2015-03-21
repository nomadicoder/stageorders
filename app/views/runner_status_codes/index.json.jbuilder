json.array!(@runner_status_codes) do |runner_status_code|
  json.extract! runner_status_code, :id, :sequence, :short_code, :description
  json.url runner_status_code_url(runner_status_code, format: :json)
end
