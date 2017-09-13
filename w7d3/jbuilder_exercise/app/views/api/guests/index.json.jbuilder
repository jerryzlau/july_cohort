json.array! @guests do |guest|
  next unless guest.over_age?(guest.age)
  json.extract! guest, :name, :age, :favorite_color
end
