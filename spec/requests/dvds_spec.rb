require 'spec_helper'

describe "Dvds" do
  specify "should be invalid without a name" do
    dvd = Dvd.new
    dvd.summary = 'foobar'
    
    dvd.should_not be_valid
    dvd.errors[:name].should include("can't be blank")
    dvd.name = 'somename'
    dvd.should be_valid
  end
  
  specify "should be invalid without a summary" do
    dvd = Dvd.new
    dvd.name = 'aname'
    
    dvd.should_not be_valid
    dvd.errors[:summary].should include("can't be blank")
    dvd.summary = 'foo summary'
    dvd.should be_valid
  end
end
