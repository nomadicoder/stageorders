json.array!(@stage_statuses) do |stage_status|
  json.extract! stage_status, :id, :team_id, :stage_id, :runner_id, :support_unit_id, :runner_status_code_id, :support_status_code_id, :stage_status_code_id
  json.url stage_status_url(stage_status, format: :json)
end
