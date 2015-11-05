# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sonja = User.create(first_name: 'Sofia', last_name: 'Dzuban', email: 'sofia@email.com', password: 'sofia', password_confirmation: 'sofia', role: 'editor')
demyd = User.create(first_name: 'Demyd', last_name: 'Dzuban', email: 'dd@email.com', password: 'demyd', password_confirmation: 'demyd')
julia = User.create(first_name: 'Юлія', last_name: 'Пелех', email: 'jpelekh@mail.ru', password: 'foobar', password_confirmation: 'foobar', role: 'admin')
monday = Timetable.create(day: 'Понеділок')
tuesday = Timetable.create(day: 'Вівторок')
wednesday = Timetable.create(day: 'Середа')
thursday = Timetable.create(day: 'Четвер')
friday = Timetable.create(day: "П'ятниця")