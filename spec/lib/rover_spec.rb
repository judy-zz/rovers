require "spec_helper"

describe Rover do
  let(:rover) {Rover.new(2, 2, "N")}
  let(:plateau) { Plateau.new(5, 5) }
  before do
    plateau.instance_variable_set(:@rovers, [])
  end

  describe "#set_direction" do
    it "should set the direction" do
      rover.direction.should == :n
    end
    it "should raise an error with an inappropriate direction" do
      expect { Rover.new(0, 0, "NW") }.to raise_error "Unknown direction NW."
    end
  end

  describe "#rotate" do
    it "should return itself" do
      rover.rotate("L").should == rover
    end
    it "should rotate the rover" do
      Rover.new(0, 1, :n).rotate("L").direction.should == :w
      Rover.new(0, 2, :w).rotate("L").direction.should == :s
      Rover.new(0, 3, :s).rotate("L").direction.should == :e
      Rover.new(0, 4, :e).rotate("L").direction.should == :n
      Rover.new(0, 5, :n).rotate("R").direction.should == :e
      Rover.new(0, 6, :w).rotate("R").direction.should == :n
      Rover.new(0, 7, :s).rotate("R").direction.should == :w
      Rover.new(0, 8, :e).rotate("R").direction.should == :s
    end
    it "should raise an error with an appropriate direction" do
      expect { rover.rotate("X") }.to raise_error "Cannot turn X. Try L or R."
    end
  end

  describe "#move" do
    it "should move appropriately when facing north" do
      rover = Rover.new(2, 2, :n)
      plateau.add_rover(rover)
      rover.move
      rover.x.should == 2
      rover.y.should == 3
    end
    it "should move appropriately when facing east" do
      rover = Rover.new(2, 2, :e)
      plateau.add_rover(rover)
      rover.move
      rover.x.should == 3
      rover.y.should == 2
    end
    it "should move appropriately when facing south" do
      rover = Rover.new(2, 2, :s)
      plateau.add_rover(rover)
      rover.move
      rover.x.should == 2
      rover.y.should == 1
    end
    it "should move appropriately when facing west" do
      rover = Rover.new(2, 2, :w)
      plateau.add_rover(rover)
      rover.move
      rover.x.should == 1
      rover.y.should == 2
    end
  end

  describe "#to_s" do
    it "should return a reasonable description of the rover" do
      Rover.new(0, 0, :n).to_s.should == "Rover(0,0)"
    end
  end
end
