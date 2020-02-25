class DiceSet
    attr_reader :values
  
    def initialize
      @values = Array.new
    end
  
    def roll(number_of_dice)
      @values = []
      number_of_dice.times do
        @values << rand(1..6)
      end
    end
  end