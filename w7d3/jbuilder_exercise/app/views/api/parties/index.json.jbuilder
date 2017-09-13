json.array! @parties do |party|
  json.extract! party, :name
  # json.gifts party.guests.gifts, :title, :description
end
