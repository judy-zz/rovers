class Rover
  DIRECTIONS = [:n, :e, :s, :w]

  attr_reader :x, :y, :direction
  attr_accessor :plateau

  def initialize(x, y, direction)
    @x = x.to_i
    @y = y.to_i
    set_direction(direction)
  end

  def set_direction(original_direction)
    direction = original_direction.downcase.to_sym
    if DIRECTIONS.include?(direction)
      @direction = direction
    else
      raise "Unknown direction #{original_direction}."
    end
  end

  def rotate(original_face)
    face = original_face.downcase.to_sym
    case face
    when :l
      @direction = DIRECTIONS[(DIRECTIONS.index(@direction) - 1) % DIRECTIONS.length]
    when :r
      @direction = DIRECTIONS[(DIRECTIONS.index(@direction) + 1) % DIRECTIONS.length]
    else
      raise "Cannot turn #{original_face}. Try L or R."
    end
    return self
  end

  def move
    case @direction
    when :n
      y = @y + 1
    when :s
      y = @y - 1
    when :e
      x = @x + 1
    when :w
      x = @x - 1
    end
    @plateau.check_for_empty_space(x || @x, y || @y)
    @x = x || @x
    @y = y || @y
  end

  def to_s
    "Rover(#{x},#{y})"
  end

end