# frozen_string_literal: true

# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  Triangle.new(a, b, c).triangle_type
end

class Triangle
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    validate_inputs
  end

  def triangle_type
    if @a == @b && @b == @c
      :equilateral
    elsif @a == @b || @a == @c || @b == @c
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_inputs
    validate_not_zero
    validate_not_negative
    validate_length_of_longest_side
  end

  def validate_not_zero
    if @a == 0 || @b == 0 || @c == 0
      raise TriangleError, "Triangles can't have zero length sides"
    end
  end

  def validate_not_negative
    if @a < 0 || @b < 0 || @c < 0
      raise TriangleError, "Triangle sides can't  have negative length"
    end
  end

  def validate_length_of_longest_side
    x, y, z = [@a, @b, @c].sort
    if z >= x + y
      raise TriangleError, 'Shorter sides of triangle must sum to greater than longest side'
    end
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
