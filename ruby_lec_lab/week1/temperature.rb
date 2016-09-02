average_temperature_in_c = {
  vancouver: 13.7,
  edmonton: 8.5,
  Calgary: 10.5
}

average_temperature_in_f = average_temperature_in_c.keys.each_with_object(average_temperature_in_c) {
  |e, a| a[e] = a[e].to_f * 9/5 + 32
}

p average_temperature_in_f
