json.array!(@teams) do |team|
  json.extract! team, :name, :role1, :role2, :role3, :role4, :role5, :role6, :role7, :role8, :role9, :role10, :rbgdate, :rbghour, :rbgmin, :rbgzone, :rbgdurationHour, :rbgdurationMin, :isAvailable, :recurs, :rolesNeeded, :classesNeeded, :listed, :description
  json.url team_url(team, format: :json)
end
