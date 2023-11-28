# frozen_string_literal: true

combinaut = Group.create!(name: 'Combinaut')
doyalstown = Project.create!(name: 'Doyalstown NLP Setup', group: combinaut, pay_rate_attributes: { magnitude: 75, unit: 'per hour' })
TimeEntry.create!(project: doyalstown, minutes: 60, created_at: Date.new(2023, 11, 17))
TimeEntry.create!(project: doyalstown, minutes: 30, created_at: Date.new(2023, 11, 16))

gunio = Group.create!(name: 'Gun.io')
glasshouse = Project.create!(name: 'Glasshouse', group: gunio, pay_rate_attributes: { magnitude: 75, unit: 'per hour' })

TimeEntry.create!(project: glasshouse, minutes: 30, created_at: Date.new(2023, 11, 21))
TimeEntry.create!(project: glasshouse, minutes: 30, created_at: Date.new(2023, 11, 20))
TimeEntry.create!(project: glasshouse, minutes: 60, created_at: Date.new(2023, 11, 19))
TimeEntry.create!(project: glasshouse, minutes: 60, created_at: Date.new(2023, 11, 17))
TimeEntry.create!(project: glasshouse, minutes: 60 * 5, created_at: Date.new(2023, 11, 15))
TimeEntry.create!(project: glasshouse, minutes: 60 * 3, created_at: Date.new(2023, 11, 14))
TimeEntry.create!(project: glasshouse, minutes: 60 * 4.5, created_at: Date.new(2023, 11, 10))
TimeEntry.create!(project: glasshouse, minutes: 60, created_at: Date.new(2023, 11, 9))
TimeEntry.create!(project: glasshouse, minutes: 60, created_at: Date.new(2023, 11, 7))

