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

  describe "#rotate" do
    it "should return itself" do
      rover = Rover.new(0, 0, :n)
      rover.rotate("L").should == rover
    end
    it "should rotate the rover" do
      Rover.new(0, 0, :n).rotate("L").direction.should == :w
      Rover.new(0, 1, :w).rotate("L").direction.should == :s
      Rover.new(0, 2, :s).rotate("L").direction.should == :e
      Rover.new(0, 3, :e).rotate("L").direction.should == :n
      Rover.new(0, 4, :n).rotate("R").direction.should == :e
      Rover.new(0, 5, :w).rotate("R").direction.should == :n
      Rover.new(0, 6, :s).rotate("R").direction.should == :w
      Rover.new(0, 7, :e).rotate("R").direction.should == :s
    end
    it "should raise an error with an appropriate direction" do
      expect { Rover.new(0, 0, "N").rotate("X") }.to raise_error "Cannot turn X. Try L or R."
    end
  end
end
