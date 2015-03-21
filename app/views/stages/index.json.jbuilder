json.array!(@stages) do |stage|
  json.extract! stage, :id, :number, :landmark, :miles, :difficulty
  json.url stage_url(stage, format: :json)
end
