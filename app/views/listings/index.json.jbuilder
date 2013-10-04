json.array!(@listings) do |listing|
  json.extract! listing, :description, :role, :listSkype, :listBattletag, :toon
  json.url listing_url(listing, format: :json)
end
