class Plateau
  attr_reader :depth, :width, :rovers

  def initialize(depth, width)
    @depth = depth.to_i
    @width = width.to_i
  end

  def add_rover(rover)
    check_for_empty_space(rover.x, rover.y)
    @rovers << rover
    rover.plateau = self
  end

  def check_for_empty_space(x, y)
    raise "Rover already exists at #{x}, #{y}." if rover_already_exists?(x, y)
    raise "Out of bounds." if out_of_bounds?(x, y)
  end

  def to_s
    "#{depth}x#{width} plateau with: #{rovers.collect(&:to_s).join(',')}"
  end

private

  def rover_already_exists?(x, y)
    @rovers.any? {|r| r.x == x && r.y == y}
  end

  def out_of_bounds?(x, y)
    x < 0 || y < 0 || x > @width || y > @depth
  end
end
