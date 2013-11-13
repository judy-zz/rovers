require 'spec_helper'

describe InputProcessor do
  describe ".process" do
    it "should run a series of instructions and return formatted output" do
      input = <<-eos
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
      eos
      InputProcessor.process(input).should == <<-eos
1 3 N
5 1 E
      eos
    end
  end
end