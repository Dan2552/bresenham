describe Bresenham::Line do
  describe ".iterate_line" do
    let(:x0) { 0 }
    let(:y0) { 0 }
    let(:x1) { 1 }
    let(:y1) { 5 }

    it "exposes each 'pixel' that the line covers" do
      collection = []

      described_class.iterate_line(x0, y0, x1, y1) do |x, y|
        collection << [x, y]
      end

      #   | 0 1 2 3 4 5
      # ---------------
      # 0 | O X X X X X
      # 1 | O X X X X X
      # 2 | O X X X X X
      # 3 | X O X X X X
      # 4 | X O X X X X
      # 5 | X O X X X X
      expect(collection).to eq(
        [
          [0, 0],
          [0, 1],
          [0, 2],
          [1, 3],
          [1, 4],
          [1, 5]
        ]
      )
    end

    context "other direction" do
      let(:x0) { 0 }
      let(:y0) { 0 }
      let(:x1) { 1 }
      let(:y1) { 5 }

      it "exposes each 'pixel' that the line covers" do
        collection = []
        described_class.iterate_line(x0, y0, x1, y1) do |x, y|
          collection << [x, y]
        end

        #   | 0 1 2 3 4 5
        # ---------------
        # 0 | O X X X X X
        # 1 | O X X X X X
        # 2 | O X X X X X
        # 3 | X O X X X X
        # 4 | X O X X X X
        # 5 | X O X X X X
        expect(collection).to eq(
          [
            [0, 0],
            [0, 1],
            [0, 2],
            [1, 3],
            [1, 4],
            [1, 5]
          ]
        )
      end
    end

    context "wider" do
      let(:x0) { 0 }
      let(:y0) { 2 }
      let(:x1) { 5 }
      let(:y1) { 3 }

      it "exposes each 'pixel' that the line covers" do
        collection = []
        described_class.iterate_line(x0, y0, x1, y1) do |x, y|
          collection << [x, y]
        end

        #   | 0 1 2 3 4 5
        # ---------------
        # 0 | X X X X X X
        # 1 | X X X X X X
        # 2 | O O O X X X
        # 3 | X X X O O O
        # 4 | X X X X X X
        # 5 | X X X X X X
        expect(collection).to eq(
          [
            [0, 2],
            [1, 2],
            [2, 2],
            [3, 3],
            [4, 3],
            [5, 3]
          ]
        )
      end
    end

    context "wider other direction" do
      let(:x0) { 5 }
      let(:y0) { 3 }
      let(:x1) { 0 }
      let(:y1) { 2 }

      it "exposes each 'pixel' that the line covers" do
        collection = []
        described_class.iterate_line(x0, y0, x1, y1) do |x, y|
          collection << [x, y]
        end

        #   | 0 1 2 3 4 5
        # ---------------
        # 0 | X X X X X X
        # 1 | X X X X X X
        # 2 | O O O X X X
        # 3 | X X X O O O
        # 4 | X X X X X X
        # 5 | X X X X X X
        expect(collection).to eq(
          [
            [0, 2],
            [1, 2],
            [2, 2],
            [3, 3],
            [4, 3],
            [5, 3]
          ]
        )
      end
    end
  end
end
