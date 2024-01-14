describe Position do
  describe '.[]' do
    it 'constructs a position' do
      position = described_class[2, 1]

      expect(position.horizontal).to be 2
      expect(position.vertical).to be 1
    end

    it "normalizes it's arguments to be within upper bounds" do
      position = described_class[5, 10]

      expect(position.horizontal).to eq Position::RIGHT_MOST
      expect(position.vertical).to eq Position::BOTTOM
    end

    it "normalizes it's arguments to be within lower bounds" do
      position = described_class[-5, -6]

      expect(position.horizontal).to be Position::LEFT_MOST
      expect(position.vertical).to be Position::TOP
    end
  end
end
