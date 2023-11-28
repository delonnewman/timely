# frozen_string_literal: true

describe Project, type: :model do
  subject(:project) { described_class.new(group:, description:) }
  let(:group) { Group.create!(name: 'This is a Test Project') }
  let(:description) { 'This is a test activity' }

  describe '#valid?' do
    it 'returns true if group and description are given' do
      expect(project).to be_valid
    end

    it 'returns true if group is not given' do
      project.group_id = nil

      expect(project).to be_valid
    end

    it 'returns false if minutes are not given' do
      project.description = nil

      expect(project).not_to be_valid
    end
  end
end
