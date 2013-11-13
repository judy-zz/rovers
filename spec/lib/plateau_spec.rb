require "spec_helper"

describe Plateau do
  let(:plateau) { Plateau.new(5, 5) }
  describe ".new" do
    it "should create a new plateau given dimensions" do
      plateau = Plateau.new(6, "8")
      plateau.depth.should == 6
      plateau.width.should == 8
    end
  end

  describe "#add_rover" do
    it "should not allow two rovers at the same position" do
      plateau.add_rover Rover.new(0, 0, :n)
      expect { plateau.add_rover Rover.new(0, 0, :n) }.to raise_error "Rover already exists at 0, 0."
    end
  end
end