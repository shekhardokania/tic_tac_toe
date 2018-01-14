require_relative 'board'
require_relative 'cell'
require_relative 'player'
require_relative 'game'
require_relative 'array_ext'

puts "Weclome! Lets begin."
p1 = TicTacToe::Player.new({color: "X", name: "Shekhar"})
p2 = TicTacToe::Player.new({color: "O", name: "Mayank"})
TicTacToe::Game.new([p1, p2]).start
