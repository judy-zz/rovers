class Plateau
  @@rovers = []

  attr_accessor :depth, :width

  def initialize(depth, width)
    @depth = depth.to_i
    @width = width.to_i
  end

  def add_rover(rover)
    ensure_rover_has_space(rover)
    @@rovers << rover
  end

private

  def ensure_rover_has_space(rover)
    raise "Rover already exists at #{rover.x}, #{rover.y}." if rover_already_exists?(rover.x, rover.y)
  end

  def rover_already_exists?(x, y)
    @@rovers.any? {|r| r.x == x && r.y == y}
  end
end
