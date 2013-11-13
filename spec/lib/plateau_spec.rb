require "spec_helper"

describe Plateau do
  let(:plateau) { Plateau.new(5, 5) }

  before do
    plateau.instance_variable_set(:@rovers, [])
  end

  describe ".new" do
    it "should create a new plateau given dimensions" do
      plateau = Plateau.new(6, "8")
      plateau.depth.should == 6
      plateau.width.should == 8
    end
  end

  describe "#check_for_empty_space" do
    it "should not allow two rovers at the same position" do
      plateau.add_rover Rover.new(0, 0, :n)
      expect { plateau.add_rover Rover.new(0, 0, :n) }.to raise_error "Rover already exists at 0, 0."
    end
    it "should raise an exception if being placed out of bounds" do
      expect { plateau.add_rover Rover.new(0, -1, :n) }.to raise_error "Out of bounds."
      expect { plateau.add_rover Rover.new(-1, 0, :n) }.to raise_error "Out of bounds."
      expect { plateau.add_rover Rover.new(6,  0, :n) }.to raise_error "Out of bounds."
      expect { plateau.add_rover Rover.new(0,  6, :n) }.to raise_error "Out of bounds."
    end
  end
end
