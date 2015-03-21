json.array!(@runners) do |runner|
  json.extract! runner, :id, :stage_id, :team_id, :runner_status_code_id, :name, :estimated_pace, :completed, :actual_time
  json.url runner_url(runner, format: :json)
end
