# frozen_string_literal: true

describe Group, type: :model do
  subject(:group) { described_class.new }

  describe '#valid?' do
    it 'returns false if the project has no name' do
      group.name = nil

      expect(group).not_to be_valid
    end

    it 'returns true if the project has a name' do
      group.name = 'This is a Test Project'

      expect(group).to be_valid
    end
  end
end
