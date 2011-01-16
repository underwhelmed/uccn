require 'spec_helper'

describe Event do
  
  it "is not valid without a name" do
    event = Event.new
    event.save
    event.errors.include?(:name).should be_true
  end
  
  it "is not valid without a description" do  
    event = Event.new
    event.name = "Test Name"
    event.save
    event.errors.include?(:description).should be_true
  end
  
  it "is not valid without a start_at date" do
     event = Event.new
      event.name = "Test Name"
      event.description = "Testing"
      event.save
      event.errors.include?(:start_at).should be_true
  end
  
  it "is not valid without an end_at date" do
    event = Event.new
    event.name = "Test Name"
    event.description = "Testing"
    event.start_at = DateTime.new(2010, 10, 1, 13, 00)
    event.save
    event.errors.include?(:end_at).should be_true
  end
  
  it "is valid with all information filled in properly" do
     event = Event.new
      event.name = "Test Name"
      event.description = "Testing this out"
      event.start_at = DateTime.new(2010, 10, 1, 13, 00)
      event.end_at = DateTime.new(2010, 10, 1, 17, 00)
      event.all_day = false
      event.members_only = false
      event.save
      event.valid?.should be_true    
  end
  
  it "is not valid with a start_at that is equal or after the end_at" do
    event = Event.new
    event.name = "Test Name"
    event.description = "Testing this out"
    event.start_at = DateTime.new(2010, 10, 1, 13, 00)
    event.end_at = DateTime.new(2010, 10, 1, 10, 00)
    event.all_day = false
    event.members_only = false
    event.save
    event.valid?.should be_false
  end
  
  it "is valid with start_at and end_at that are equal if set to all day" do
  end
  
end