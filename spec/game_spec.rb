require_relative "../game.rb"
require_relative "../player.rb"
require_relative "../board.rb"

module TicTacToe
  describe Game do

    let (:shekhar) { Player.new({color: "X", name: "Shekhar"}) }
    let (:mayank) { Player.new({color: "O", name: "Mayank"}) }
    let (:game) { Game.new([shekhar, mayank]) }

    context "#initialize" do
      it "randomly selects a current_player" do
        allow_any_instance_of(Array).to receive(:shuffle) { [mayank, shekhar] }
        game = Game.new([shekhar, mayank])
        expect(game.current_player).to eq mayank
      end

      it "randomly selects an other player" do
        allow_any_instance_of(Array).to receive(:shuffle) { [mayank, shekhar] }
        game = Game.new([shekhar, mayank])
        expect(game.other_player).to eq shekhar
      end
    end

    context "#toogle_players" do
      it "will set @current_player to @other_player" do
        game = Game.new([shekhar, mayank])
        other_player = game.other_player
        game.toogle_players
        expect(game.current_player).to eq other_player
      end

      it "will set @other_player to @current_player" do
        game = Game.new([shekhar, mayank])
        current_player = game.current_player
        game.toogle_players
        expect(game.other_player).to eq current_player
      end
    end


    context "#valid_move?" do
      it "returns true when valid" do
        game = Game.new([shekhar, mayank])
        expect(game.valid_move?("3")).to eq true
      end

      it "return false when invalid" do
        game = Game.new([shekhar, mayank])
        expect(game.valid_move?("10")).to eq false 
      end
    end

  end
end

