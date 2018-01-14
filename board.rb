module TicTacToe
  class Board
    attr_reader :grid
    def initialize(grid = Array.new(3) { Array.new(3) { Cell.new } })
      @grid = grid
    end

    def get_cell(x, y)
      grid[y][x]
    end

    def set_cell(x, y, value)
       cell = get_cell(x, y)
       return false if cell.occupied? 
       cell.value = value
       return true
    end

    def game_over
      return :winner if winner?
      return :draw if draw?
      false
    end

    def formatted_grid
      grid.each do |row|
        puts row.map { |cell| cell.value.empty? ? "_" : cell.value }.join(" ")
      end
    end

    private


    def draw?
      grid.flatten.map { |cell| cell.value }.none_empty?
    end

    def winner?
      winning_positions.each do |winning_position|
        next if winning_position_values(winning_position).all_empty?
        return true if winning_position_values(winning_position).all_same?
      end
      false
    end

    def winning_position_values(winning_position)
      winning_position.map { |cell| cell.value }
    end

    def winning_positions
      grid + grid.transpose + diagonals
    end

    def diagonals
      [
        [get_cell(0, 0), get_cell(1, 1), get_cell(2, 2)],
        [get_cell(0, 2), get_cell(1, 1), get_cell(2, 0)]
      ]
    end

  end
end

