# frozen_string_literal: true

team = Team.create!(name: 'Delon R. Newman Software')

team.users.create!(name: 'Jackie Newman', email: 'jackie.muller.newman@icloud.com', password: 'testing123').tap(&:confirm)
delon = team.users.create!(name: 'Delon Newman', email: 'contact@delonnewman.name', password: 'testing123').tap(&:confirm)

theocratic = team.groups.create!(name: 'Theocratic')

ministry = theocratic.projects.create!(name: 'Field Ministry')
ministry.time_entries.create!(
  [
    {
      user: delon,
      duration: 33,
      created_at: Date.new(2023, 11, 17),
      description: 'Texting Michael'
    },
  ]
)

bethel = theocratic.projects.create!(name: 'Bethel')
bethel.time_entries.create!(
  [
    {
      user: delon,
      duration: '06:18',
      created_at: Date.new(2023, 11, 24),
      description: 'Vitest Integration'
    },
    {
      user: delon,
      duration: '01:27',
      created_at: Date.new(2023, 11, 17),
      description: 'Meeting'
    },
    {
      user: delon,
      duration: '00:22',
      created_at: Date.new(2023, 11, 17),
      description: 'Administrative'
    },
    {
      user: delon,
      duration: '00:21',
      created_at: Date.new(2023, 11, 17),
      description: 'More error handling enhancements'
    },
    {
      user: delon,
      duration: '00:10',
      created_at: Date.new(2023, 11, 21),
    },
    {
      user: delon,
      duration: '02:35',
      created_at: Date.new(2023, 11, 16),
      description: 'More error handling enhancements'
    },
    {
      user: delon,
      duration: '01:13',
      created_at: Date.new(2023, 11, 13),
      description: 'More error handling enhancements'
    },
    {
      user: delon,
      duration: '03:30',
      created_at: Date.new(2023, 11, 11),
      description: 'More error handling enhancements'
    },
    {
      user: delon,
      duration: '00:30',
      created_at: Date.new(2023, 11, 10),
      description: 'Administrative'
    },
    {
      user: delon,
      duration: '02:03',
      created_at: Date.new(2023, 11, 9),
      description: 'More error handling enhancements'
    },
    {
      user: delon,
      duration: '02:18',
      created_at: Date.new(2023, 11, 9),
      description: 'More error handling enhancements'
    },
    {
      user: delon,
      duration: '01:03',
      created_at: Date.new(2023, 11, 3),
      description: 'Meeting'
    },
    {
      user: delon,
      duration: '00:37',
      created_at: Date.new(2023, 11, 2),
      description: 'More error handling enhancements'
    },
    {
      user: delon,
      duration: '00:47',
      created_at: Date.new(2023, 11, 1),
    },
    {
      user: delon,
      duration: '00:53',
      created_at: Date.new(2023, 10, 31),
    },
    {
      user: delon,
      duration: '01:21',
      created_at: Date.new(2023, 10, 30),
    },
    {
      user: delon,
      duration: '01:00',
      created_at: Date.new(2023, 10, 29),
    },
    {
      user: delon,
      duration: '01:25',
      created_at: Date.new(2023, 10, 28),
    },
    {
      user: delon,
      duration: '04:08',
      created_at: Date.new(2023, 10, 27),
    },
    {
      user: delon,
      duration: '02:00',
      created_at: Date.new(2023, 10, 26),
    },
    {
      user: delon,
      duration: '03:45',
      created_at: Date.new(2023, 10, 25),
    },
  ]
)

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
    {
      user: delon,
      duration: '07:13',
      created_at: Date.new(2023, 12, 6)
    },
    {
      user: delon,
      duration: '04:31',
      created_at: Date.new(2023, 12, 7)
    },
  ]
)

dragnet = internal.projects.create!(name: 'Dragnet')
dragnet.time_entries.create!(
  [
    {
      user: delon,
      duration: '00:08',
      created_at: Date.new(2023, 11, 21)
    },
    {
      user: delon,
      duration: '00:21',
      created_at: Date.new(2023, 11, 2)
    },
  ]
)

learning = internal.projects.create!(name: 'Learning')
learning.time_entries.create!(
  [
    {
      user: delon,
      duration: '00:38',
      created_at: Date.new(2023, 11, 18)
    },
    {
      user: delon,
      duration: '03:23',
      created_at: Date.new(2023, 11, 21)
    },
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
    },
    {
      user: delon,
      duration: '00:52',
      created_at: Date.new(2023, 12, 6)
    },
    {
      user: delon,
      duration: '00:33',
      created_at: Date.new(2023, 11, 17),
    },
    {
      user: delon,
      duration: '00:30',
      created_at: Date.new(2023, 11, 17),
      description: '"Administrative Development"?'
    },
    {
      user: delon,
      duration: '02:33',
      created_at: Date.new(2023, 11, 14)
    },
    {
      user: delon,
      duration: '00:11',
      created_at: Date.new(2023, 11, 13)
    },
    {
      user: delon,
      duration: '02:57',
      created_at: Date.new(2023, 11, 9)
    },
    {
      user: delon,
      duration: '00:55',
      created_at: Date.new(2023, 11, 8)
    },
    {
      user: delon,
      duration: '00:31',
      created_at: Date.new(2023, 11, 7)
    },
    {
      user: delon,
      duration: '00:32',
      created_at: Date.new(2023, 11, 4)
    },
    {
      user: delon,
      duration: '04:42',
      created_at: Date.new(2023, 11, 3)
    },
    {
      user: delon,
      duration: '00:45',
      created_at: Date.new(2023, 11, 2)
    },
    {
      user: delon,
      duration: '00:40',
      created_at: Date.new(2023, 10, 24)
    },
  ]
)

marketing = internal.projects.create!(name: 'Marketing')
marketing.time_entries.create!(
  [
    {
      user: delon,
      duration: '01:09',
      created_at: Date.new(2023, 11, 18)
    },
    {
      user: delon,
      duration: '01:36',
      created_at: Date.new(2023, 11, 30)
    },
    {
      user: delon,
      duration: '00:13',
      created_at: Date.new(2023, 12, 5)
    },
    {
      user: delon,
      duration: '01:59',
      created_at: Date.new(2023, 11, 17)
    },
    {
      user: delon,
      duration: '03:02',
      created_at: Date.new(2023, 11, 16)
    },
    {
      user: delon,
      duration: '01:32',
      created_at: Date.new(2023, 11, 14)
    },
    {
      user: delon,
      duration: '01:03',
      created_at: Date.new(2023, 11, 10)
    },
    {
      user: delon,
      duration: '01:18',
      created_at: Date.new(2023, 11, 9)
    },
    {
      user: delon,
      duration: '04:44',
      created_at: Date.new(2023, 11, 7)
    },
    {
      user: delon,
      duration: '00:54',
      created_at: Date.new(2023, 11, 6)
    },
    {
      user: delon,
      duration: '01:04',
      created_at: Date.new(2023, 11, 3)
    },
    {
      user: delon,
      duration: '01:12',
      created_at: Date.new(2023, 11, 2)
    },
  ]
)

writing = internal.projects.create!(name: 'Writing')
writing.time_entries.create!(
  [
    {
      user: delon,
      duration: '00:36',
      created_at: Date.new(2023, 11, 23)
    },
    {
      user: delon,
      duration: '02:23',
      created_at: Date.new(2023, 11, 22)
    },
    {
      user: delon,
      duration: '01:11',
      created_at: Date.new(2023, 11, 17)
    },
  ]
)

combinaut = team.groups.create!(name: 'Combinaut')
atrium = combinaut.projects.create!(
  name: 'Atrium Sprint 11', pay_rate_attributes: { magnitude: 75, unit: 'per hour' }, billable: true
)

atrium.time_entries.create!(
  [
    {
      user: delon,
      minutes: 28,
      created_at: Date.new(2023, 11, 16),
      description: 'Meeting w/ Lily regarding sprint tickets, review items'
    },
    {
      user: delon,
      minutes: 39,
      created_at: Date.new(2023, 11, 2),
      description: 'Atrium #1322'
    },
    {
      user: delon,
      minutes: 55,
      created_at: Date.new(2023, 11, 1),
      description: 'Administrative'
    },
  ]
)

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
    },
    {
      user: delon,
      duration: '00:33',
      created_at: Date.new(2023, 11, 30),
      description: 'Met w/ Sebastian regarding Doylestown'
    },
    {
      user: delon,
      duration: '00:17',
      created_at: Date.new(2023, 11, 17),
      description: 'Sparkle / Chatterbox integration'
    },
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
      minutes: 39,
      created_at: Date.new(2023, 11, 21),
      description: 'Sprint Meeting'
    },
    {
      user: delon,
      minutes: 24,
      created_at: Date.new(2023, 11, 20),
      description: 'Fixed issue after production deploy'
    },
    {
      user: delon,
      minutes: 56,
      created_at: Date.new(2023, 11, 19),
      description: 'Deployed Glasshouse to production'
    },
    {
      user: delon,
      minutes: 14,
      created_at: Date.new(2023, 11, 18),
      description: 'Working on deployment'
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
    },
    {
      user: delon,
      minutes: 41,
      created_at: Date.new(2023, 11, 17),
      description: 'Issue #18'
    },
    {
      user: delon,
      duration: '04:55',
      created_at: Date.new(2023, 11, 15),
      description: 'Working on issues'
    },
    {
      user: delon,
      duration: '03:22',
      created_at: Date.new(2023, 11, 14),
      description: 'Working on issues'
    },
    {
      user: delon,
      duration: '03:26',
      created_at: Date.new(2023, 11, 10),
      description: 'Issue #15'
    },
    {
      user: delon,
      duration: '01:04',
      created_at: Date.new(2023, 11, 10),
      description: 'Estimating'
    },
    {
      user: delon,
      duration: '01:22',
      created_at: Date.new(2023, 11, 9),
      description: 'Estimating'
    },
    {
      user: delon,
      duration: '00:42',
      created_at: Date.new(2023, 11, 7),
      description: 'Administrative'
    },
    {
      user: delon,
      duration: '01:32',
      created_at: Date.new(2023, 11, 2),
      description: 'Administrative'
    },
    {
      user: delon,
      duration: '02:07',
      created_at: Date.new(2023, 10, 31),
      description: 'Issue #6'
    },
    {
      user: delon,
      duration: '01:17',
      created_at: Date.new(2023, 10, 31),
      description: 'Working on issues'
    },
    {
      user: delon,
      duration: '00:37',
      created_at: Date.new(2023, 10, 30),
      description: 'First Aid'
    },
    {
      user: delon,
      duration: '00:11',
      created_at: Date.new(2023, 10, 26),
      description: 'First Aid'
    },
    {
      user: delon,
      duration: '01:46',
      created_at: Date.new(2023, 10, 24),
      description: 'First Aid'
    },
    {
      user: delon,
      duration: '00:19',
      created_at: Date.new(2023, 10, 24),
      description: 'Logging time'
    },
  ]
)
