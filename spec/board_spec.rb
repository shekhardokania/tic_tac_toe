require_relative "../array_ext.rb"
require_relative "../board.rb"
require_relative "../game.rb"
require_relative "../player.rb"
require_relative "../cell.rb"

module TicTacToe
  describe Board do

    TestCell = Struct.new(:value)
    let(:x_cell) { TestCell.new("X") }
    let(:y_cell) { TestCell.new("Y") }
    let(:empty) { TestCell.new }

    context "#game_over" do
      it "returns :winner if winner? is true" do
        board = Board.new
        allow(board).to receive(:winner?) { true }
        expect(board.game_over).to eq :winner
      end

      it "returns :draw if winner? is false and draw? is true" do
        board = Board.new
        allow(board).to receive(:winner?) { false }
        allow(board).to receive(:draw?) { true }
        expect(board.game_over).to eq :draw
      end

      it "returns false if winner? is false and draw? is false" do
        board = Board.new
        allow(board).to receive(:winner?) { false }
        allow(board).to receive(:draw?) { false }
        expect(board.game_over).to be_falsey
      end

      it "returns :winner when row has objects with values that are all the same" do
        grid = [
          [x_cell, x_cell, x_cell],
          [y_cell, x_cell, y_cell],
          [y_cell, y_cell, empty]
        ]
        board = Board.new(grid)
        expect(board.game_over).to eq :winner
      end

      it "returns :winner when colum has objects with values that are all the same" do
        grid = [
          [x_cell, x_cell, empty],
          [y_cell, x_cell, y_cell],
          [y_cell, x_cell, empty]
        ]
        board = Board.new(grid)
        expect(board.game_over).to eq :winner
      end

      it "returns :winner when diagonal has objects with values that are all the same" do
        grid = [
          [x_cell, empty, empty],
          [y_cell, x_cell, y_cell],
          [y_cell, x_cell, x_cell]
        ]
        board = Board.new(grid)
        expect(board.game_over).to eq :winner
      end

      it "returns :draw when all spaces on the board are taken" do
        grid = [
          [x_cell, y_cell, x_cell],
          [y_cell, x_cell, y_cell],
          [y_cell, x_cell, y_cell]
        ]
        board = Board.new(grid)
        expect(board.game_over).to eq :draw
      end

      it "returns false when there is no winner or draw" do
        grid = [
          [x_cell, empty, empty],
          [y_cell, empty, empty],
          [y_cell, empty, empty]
        ]
        board = Board.new(grid)
        expect(board.game_over).to be_falsey
      end
    end

  end
end
