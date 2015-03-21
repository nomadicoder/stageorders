json.array!(@support_units) do |support_unit|
  json.extract! support_unit, :id, :team_id, :support_type_id, :tac_callsign, :ham_callsign, :support_status_code_id, :current_stage_id, :location_lat, :location_lon
  json.url support_unit_url(support_unit, format: :json)
end
