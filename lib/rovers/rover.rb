class Rover
  @@all = []
  @@directions = [:n, :e, :s, :w]
  class << self
    def all
      @@all
    end

    def rover_already_exists?(x, y)
      all.each {|r| raise "Rover already exists at #{x}, #{y}." if r.x == x && r.y == y}
    end
  end

  attr_accessor :x, :y, :direction

  def initialize(x, y, direction)
    @x = x
    @y = y
    set_direction(direction)
    Rover.rover_already_exists?(x, y)
    @@all << self
  end

  def set_direction(original_direction)
    direction = original_direction.downcase.to_sym
    if @@directions.include?(direction)
      @direction = direction
    else
      raise "Unknown direction #{original_direction}."
    end
  end

  def to_s
    "Rover(#{x},#{y})"
  end

  def rotate(original_face)
    face = original_face.downcase.to_sym
    case face
    when :l
      @direction = @@directions[(@@directions.index(@direction) - 1) % @@directions.length]
    when :r
      @direction = @@directions[(@@directions.index(@direction) + 1) % @@directions.length]
    else
      raise "Cannot turn #{original_face}. Try L or R."
    end
    return self
  end

end