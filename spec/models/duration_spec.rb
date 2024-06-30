# frozen_string_literal: true

RSpec.describe Duration, type: :model do
  describe '.zero' do
    it 'returns a duration of zero minutes' do
      expect(described_class.zero.minutes).to be 0
    end

    it 'returns a duration that is zero' do
      expect(described_class.zero).to be_zero
    end
  end

  describe '.minutes' do
    it 'returns a duration of the given number of minutes' do
      expect(described_class.minutes(34).minutes).to be 34
    end
  end

  describe '.hours' do
    it 'returns a duration of the given number of hours' do
      expect(described_class.hours(1).minutes).to be 60
    end
  end

  describe '.parse' do
    example '03:30' do
      expect(described_class.parse('03:30').minutes).to be 210
    end

    example '3:30' do
      expect(described_class.parse('3:30').minutes).to be 210
    end

    example '3h 30m' do
      expect(described_class.parse('3h 30m').minutes).to be 210
    end

    example '3h30m' do
      expect(described_class.parse('3h30m').minutes).to be 210
    end

    example '3h,30m' do
      expect(described_class.parse('3h,30m').minutes).to be 210
    end

    example '3h, 30m' do
      expect(described_class.parse('3h, 30m').minutes).to be 210
    end
  end

  describe '.[]' do
    example 'with two arguments' do
      expect(described_class[3, 30].minutes).to be 210
    end

    example 'with one string argument' do
      expect(described_class['3:30'].minutes).to be 210
    end

    example 'with one non-string argument' do
      expect(described_class[210].minutes).to be 210
    end
  end

  describe '#to_s' do
    it 'presents the duration in H:MM format' do
      expect(described_class[210].to_s).to eq '3:30'
    end
  end
end
