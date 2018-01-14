module TicTacToe
  class Game

    attr_reader :players, :board, :current_player, :other_player
    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def toogle_players
      @current_player, @other_player = @other_player, @current_player
    end

    def game_end_message
      return "#{current_player.name} won!" if board.game_over == :winner
      return "The game ended in a tie" if board.game_over == :draw
    end

    def valid_move?(move)
      !move.nil? && !move.empty? && (1..9).include?(move.to_i)
    end	

    def start
      puts "#{current_player.name} will start the page."
      while true
        board.formatted_grid
        puts ""
        loop do 
          puts "#{current_player.name}: Make your move(1-9): "
           move = gets.chomp
           x, y = get_coordinate_from_move(move)
           if valid_move?(move) && board.set_cell(x, y, current_player.color)
	      break
           else
              puts "Invalid move, pls select again."
           end
	      end
        if board.game_over
           puts game_end_message
           board.formatted_grid
           return
        else
          toogle_players
        end
      end
    end

    private

    def get_coordinate_from_move(move)
      {
        "1" => [0, 0],
        "2" => [1, 0],
        "3" => [2, 0],
        "4" => [0, 1],
        "5" => [1, 1],
        "6" => [2, 1],
        "7" => [0, 2],
        "8" => [1, 2],
        "9" => [2, 2]
      }[move]
    end

  end
end


