require "spec_helper"

describe Rover do
  before(:each) do
    Rover.class_variable_set :@@all, []
  end

  describe ".all" do
    it "should return an array of existing rovers" do
      rover1 = Rover.new(0, 1, :n)
      rover2 = Rover.new(1, 0, :n)
      Rover.all.should =~ [rover1, rover2]
    end
  end

  describe ".new" do
    it "should not allow two rovers at the same position" do
      existing_rover = Rover.new(0, 0, :n)
      expect { Rover.new(0, 0, :n) }.to raise_error "Rover already exists at 0, 0."
    end
  end

  describe "#to_s" do
    it "should return a reasonable description of the rover" do
      Rover.new(0, 0, :n).to_s.should == "Rover(0,0)"
    end
  end

  describe "#set_direction" do
    it "should set the direction" do
      Rover.new(0, 0, "N").direction.should == :n
    end
    it "should raise an error with an inappropriate direction" do
      expect { Rover.new(0, 0, "NW") }.to raise_error "Unknown direction NW."
    end
  end
end
