# frozen_string_literal: true

team = Team.create!(name: 'Delon R. Newman Software')

team.users.create!(name: 'Jackie Newman', email: 'jackie.muller.newman@icloud.com', password: 'testing123').tap(&:confirm)
delon = team.users.create!(name: 'Delon Newman', email: 'contact@delonnewman.name', password: 'testing123').tap(&:confirm)

internal = team.groups.create!(name: 'Internal')

timely = internal.projects.create!(name: 'Timely')
timely.time_entries.create!(
  [
    {
      user: delon,
      duration: '04:31',
      created_at: Date.new(2023, 11, 27)
    },
    {
      user: delon,
      duration: '01:05',
      created_at: Date.new(2023, 11, 28)
    },
    {
      user: delon,
      minutes: 30,
      created_at: Date.new(2023, 11, 28),
    },
    {
      user: delon,
      duration: '01:36',
      created_at: Date.new(2023, 11, 30)
    },
    {
      user: delon,
      duration: '02:17',
      created_at: Date.new(2023, 12, 5)
    },
  ]
)

learning = internal.projects.create!(name: 'Learning')
learning.time_entries.create!(
  [
    {
      user: delon,
      duration: '00:33',
      created_at: Date.new(2023, 11, 28)
    },
    {
      user: delon,
      duration: '03:32',
      created_at: Date.new(2023, 11, 29)
    },
    {
      user: delon,
      duration: '03:45',
      created_at: Date.new(2023, 11, 30)
    }
  ]
)

marketing = internal.projects.create!(name: 'Marketing')
marketing.time_entries.create!(
  [
    {
      user: delon,
      duration: '01:36',
      created_at: Date.new(2023, 11, 30)
    },
    {
      user: delon,
      duration: '00:13',
      created_at: Date.new(2023, 12, 5)
    }
  ]
)

combinaut = team.groups.create!(name: 'Combinaut')
doylestown = combinaut.projects.create!(
  name: 'Doylestown NLP Setup', pay_rate_attributes: { magnitude: 75, unit: 'per hour' }, billable: true
)

doylestown.time_entries.create!(
  [
    {
      user: delon,
      minutes: 52,
      created_at: Date.new(2023, 11, 23),
      description: 'Sparkle / Chatterbox integration'
    },
    {
      user: delon,
      minutes: 49,
      created_at: Date.new(2023, 11, 17),
      description: 'Getting up-to-date w/ Sparkle and Chatterbox; started working on Sparkle / Chatterbox integration'
    },
    {
      user: delon,
      minutes: 28,
      created_at: Date.new(2023, 11, 16),
      description: 'Meeting w/ Sebastian regarding Chatterbox / Sparkle integration, documentation,' \
                 ' and Doylestown configuration. Did some followup as well.'
    },
    {
      user: delon,
      duration: '04:27',
      created_at: Date.new(2023, 11, 28),
      description: 'Worked on Chatterbox documentation and test suite'
    },
    {
      user: delon,
      minutes: 95,
      created_at: Date.new(2023, 12, 5),
      description: 'Worked on generating data for Doylestown configuration'
    },
    {
      user: delon,
      duration: '00:10',
      created_at: Date.new(2023, 11, 30),
      description: 'Sparkle / Chatterbox integration'
    }
  ]
)


gun = team.groups.create!(name: 'Gun.io')
glasshouse = gun.projects.create!(
  name: 'Glasshouse', pay_rate_attributes: { magnitude: 75, unit: 'per hour' }, billable: true
)

glasshouse.time_entries.create!(
  [
    {
      user: delon,
      duration: '05:15',
      created_at: Date.new(2023, 11, 24),
      description: 'Working on front-end issues'
    },
    {
      user: delon,
      minutes: 15,
      created_at: Date.new(2023, 11, 23),
      description: 'Working on front-end issues'
    },
    {
      user: delon,
      minutes: 30,
      created_at: Date.new(2023, 11, 21),
      description: 'Sprint Meeting'
    },
    {
      user: delon,
      minutes: 30,
      created_at: Date.new(2023, 11, 20),
      description: 'Fixed issue after production deploy'
    },
    {
      user: delon,
      minutes: 60,
      created_at: Date.new(2023, 11, 19),
      description: 'Deployed Glasshouse to production'
    },
    {
      user: delon,
      minutes: 60,
      created_at: Date.new(2023, 11, 17),
      description: 'Working on issue #18 w/ Rebecca'
    },
    {
      user: delon,
      duration: '05:00',
      created_at: Date.new(2023, 11, 15),
      description: 'Working on issue #11'
    },
    {
      user: delon,
      duration: '03:00',
      created_at: Date.new(2023, 11, 14),
      description: 'Resolved issues #15 and #20'
    },
    {
      user: delon,
      duration: '04:30',
      created_at: Date.new(2023, 11, 10),
      description: 'Estimating and working on issue #15'
    },
    {
      user: delon,
      minutes: 60,
      created_at: Date.new(2023, 11, 9),
      description: 'Reviewing and estimating issues'
    },
    {
      user: delon,
      minutes: 60,
      created_at: Date.new(2023, 11, 7),
      description: 'Met w/ Bill and Rebecca regarding path forward'
    },
    {
      user: delon,
      minutes: 55,
      created_at: Date.new(2023, 11, 29),
      description: 'Met w/ Rebecca regarding issues #1 and #3 determined that #1 is closed for now'
    }
  ]
)
