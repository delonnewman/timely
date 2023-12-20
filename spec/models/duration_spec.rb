# frozen_string_literal: true

describe Duration, type: :model do
  describe '.parse' do
    example 'HH:MM format' do
      duration = Duration.parse('03:30')

      expect(duration.minutes).to be 210
    end

    example 'H:MM format' do
      duration = Duration.parse('3:30')

      expect(duration.minutes).to be 210
    end
  end

  describe '.[]' do
    example 'with two arguments' do
      duration = Duration[3, 30]

      expect(duration.minutes).to be 210
    end

    example 'with one string argument' do
      duration = Duration['3:30']

      expect(duration.minutes).to be 210
    end

    example 'with one non-string argument' do
      duration = Duration[210]

      expect(duration.minutes).to be 210
    end
  end

  describe '.to_s' do
    it 'presents the duration in H:MM format' do
      duration = Duration[210]

      expect(duration.to_s).to eq '3:30'
    end
  end
end
