# frozen_string_literal: true

describe TimeEntry, type: :model do
  subject(:entry) { described_class.new(project:, minutes:) }
  let(:project) { Project.create!(description: 'This is a Test Project') }
  let(:minutes) { 56 }

  describe '#valid?' do
    it 'returns true if activity and minutes are given' do
      expect(entry).to be_valid
    end

    it 'returns false if activity is not given' do
      entry.activity_id = nil

      expect(entry).not_to be_valid
    end

    it 'returns false if minutes are not given' do
      entry.minutes = nil

      expect(entry).not_to be_valid
    end
  end
end
