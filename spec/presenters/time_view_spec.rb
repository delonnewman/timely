require 'rails_helper'

RSpec.describe TimeView do
  subject(:view) { described_class[:day].new(user, date) }

  let(:user) { User.first }
  let(:date) { Date.today }
end
