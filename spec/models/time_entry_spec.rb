# frozen_string_literal: true

describe TimeEntry, type: :model do
  subject(:entry) { described_class.new(project:, minutes:) }
  let(:project) { Project.create!(name: 'This is a Test Project', group: Group.create!(name: 'Test Group')) }
  let(:minutes) { 56 }

  describe '#valid?' do
    it 'returns true if project and minutes are given' do
      expect(entry).to be_valid
    end

    it 'returns false if project is not given' do
      entry.project_id = nil

      expect(entry).not_to be_valid
    end

    it 'returns false if minutes are not given' do
      entry.minutes = nil

      expect(entry).not_to be_valid
    end
  end
end
