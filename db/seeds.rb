# frozen_string_literal: true

combinaut = Group.create!(name: 'Combinaut')
doyalstown = Project.create!(name: 'Doyalstown NLP Setup', group: combinaut, pay_rate_attributes: { magnitude: 75, unit: 'per hour' })
TimeEntry.create!(project: doyalstown, minutes: 52, created_at: Date.new(2023, 11, 23), description: "Sparkle / Chatterbox integration")
TimeEntry.create!(project: doyalstown, minutes: 49, created_at: Date.new(2023, 11, 17), description: "Getting up-to-date w/ Sparkle and Chatterbox; started working on Sparkle / Chatterbox integration")
TimeEntry.create!(project: doyalstown, minutes: 28, created_at: Date.new(2023, 11, 16), description: "Meeting w/ Sebastian regarding Chatterbox / Sparkle integration, documentation, and Doylestown configuration. Did some followup as well.")

gunio = Group.create!(name: 'Gun.io')
glasshouse = Project.create!(name: 'Glasshouse', group: gunio, pay_rate_attributes: { magnitude: 75, unit: 'per hour' })

TimeEntry.create!(project: glasshouse, minutes: 60 * 5.25, created_at: Date.new(2023, 11, 24), description: "Working on front-end issues")
TimeEntry.create!(project: glasshouse, minutes: 15, created_at: Date.new(2023, 11, 23), description: "Working on front-end issues")
TimeEntry.create!(project: glasshouse, minutes: 30, created_at: Date.new(2023, 11, 21), description: "Sprint Meeting")
TimeEntry.create!(project: glasshouse, minutes: 30, created_at: Date.new(2023, 11, 20), description: "Fixed issue after production deploy")
TimeEntry.create!(project: glasshouse, minutes: 60, created_at: Date.new(2023, 11, 19), description: "Deployed Glasshouse to production")
TimeEntry.create!(project: glasshouse, minutes: 60, created_at: Date.new(2023, 11, 17), description: "Working on issue #18 w/ Rebecca")
TimeEntry.create!(project: glasshouse, minutes: 60 * 5, created_at: Date.new(2023, 11, 15), description: "Working on issue #11")
TimeEntry.create!(project: glasshouse, minutes: 60 * 3, created_at: Date.new(2023, 11, 14), description: "Resolved issues #15 and #20")
TimeEntry.create!(project: glasshouse, minutes: 60 * 4.5, created_at: Date.new(2023, 11, 10), description: "Estimating and working on issue #15")
TimeEntry.create!(project: glasshouse, minutes: 60, created_at: Date.new(2023, 11, 9), description: "Reviewing and estimating issues")
TimeEntry.create!(project: glasshouse, minutes: 60, created_at: Date.new(2023, 11, 7), description: "Met w/ Bill and Rebecca regarding path forward")

