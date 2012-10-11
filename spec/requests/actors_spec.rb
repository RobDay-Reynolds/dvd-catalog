require 'spec_helper'


describe "Actors" do
  specify "should be invalid without a name" do
    actor = Actor.new
    actor.gender = 'Male'
    
    actor.should_not be_valid
    actor.errors[:name].should eq(["can't be blank"])
    actor.name = 'somename'
    actor.should be_valid
  end
  
  specify "should be invalid without a gender" do
    actor = Actor.new
    actor.name = 'aname'
    
    actor.should_not be_valid
    actor.errors[:gender].should eq(["can't be blank"])
    actor.gender = 'Male'
    actor.should be_valid
  end
end
