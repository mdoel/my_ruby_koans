# frozen_string_literal: true

# Class to determine a score in a game of Greed

class DiceScorer
  def initialize(dice)
    @dice = dice
    validate_dice
end

def score
    @total_points = 0
    add_points_for_three_ones
    add_points_for_other_triplets
    add_points_for_ones_outside_of_triplet
    add_points_for_fives_outside_of_triplet
    @total_points
  end

  private

  def validate_dice
    raise "No dice passed" if @dice.nil?
    raise "Too many dice" if @dice.count > 5
  end

  def digit_count(digit)
    @dice.select { |d| digit == d }.count
  end

  def add_points_for_three_ones
    @total_points += 1000 if digit_count(1) >= 3
  end

  def add_points_for_other_triplets
    [2, 3, 4, 5, 6].each do |digit|
      @total_points += digit * 100 if digit_count(digit) >= 3
    end
  end

  def add_points_for_ones_outside_of_triplet
    @total_points += [0,100, 200, 0, 100, 200][digit_count(1)]
  end

  def add_points_for_fives_outside_of_triplet
    @total_points += [0,50, 100, 0, 50, 100][digit_count(5)]
  end
end
