# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tube_lines = [
  {name: 'bakerloo', mode_name: 'tube'},
  {name: 'central', mode_name: 'tube'},
  {name: 'circle', mode_name: 'tube'},
  {name: 'district', mode_name: 'tube'},
  {name: 'hammersmith-city', mode_name: 'tube'},
  {name: 'jubilee', mode_name: 'tube'},
  {name: 'metropolitan', mode_name: 'tube'},
  {name: 'northern', mode_name: 'tube'},
  {name: 'piccadilly', mode_name: 'tube'},
  {name: 'victoria', mode_name: 'tube'},
  {name: 'waterloo-city', mode_name: 'tube'}
]

Line.create(tube_lines)
