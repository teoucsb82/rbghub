json.array!(@comps) do |comp|
  json.extract! comp, :listplayers
  json.url comp_url(comp, format: :json)
end
