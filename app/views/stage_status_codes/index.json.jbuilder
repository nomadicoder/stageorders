json.array!(@stage_status_codes) do |stage_status_code|
  json.extract! stage_status_code, :id, :short_code, :description, :sequence, :runner_status_code_id, :support_status_code_id
  json.url stage_status_code_url(stage_status_code, format: :json)
end
