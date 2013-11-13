require "singleton"

class InputProcessor
  include Singleton

  # This assumes properly formatted input! Multiple attempts have been made
  # to ensure errors are appropriately raised when input data is not
  # sanitized. There are probably still edge cases. Check your input!
  def self.process(input)
    instructions = input.split("\n")
    plateau = create_plateau(instructions.shift)
    instructions.each_slice(2) {|rover| run_rover(rover, plateau)}
    plateau.to_structured_output
  end

  def self.create_plateau(instructions)
    depth, width = instructions.strip.split(' ')
    @plateau = Plateau.new(depth, width)
  end

  def self.run_rover(instructions, plateau)
    x, y, direction = instructions[0].strip.split(" ")
    rover = Rover.new(x, y, direction)
    plateau.add_rover(rover)
    instructions[1].each_char do |letter|
      case letter.upcase
      when "L", "R"
        rover.rotate(letter)
      when "M"
        rover.move
      else
        raise "I don't understand the instruction #{letter}."
      end
    end
  end
end
