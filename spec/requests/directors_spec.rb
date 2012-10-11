require 'spec_helper'

describe "Directors" do
  specify "should be invalid without a name" do
    director = Director.new
    director.gender = 'Male'
    
    director.should_not be_valid
    director.errors[:name].should eq(["can't be blank"])
    director.name = 'somename'
    director.should be_valid
  end
  
  specify "should be invalid without a gender" do
    director = Director.new
    director.name = 'aname'
    
    director.should_not be_valid
    director.errors[:gender].should eq(["can't be blank"])
    director.gender = 'Male'
    director.should be_valid
  end
end
