module TicTacToe
  class Cell
    attr_accessor :value
    def initialize(value = "")
      @value = value
    end

    def occupied?
      !(value.nil? || value.empty?)
    end
  end
end
