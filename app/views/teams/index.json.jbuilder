json.array!(@teams) do |team|
  json.extract! team, :id, :number, :name, :short_name, :start_time
  json.url team_url(team, format: :json)
end
