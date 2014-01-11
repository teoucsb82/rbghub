json.array!(@teamstats) do |teamstat|
  json.extract! teamstat, :input
  json.url teamstat_url(teamstat, format: :json)
end
