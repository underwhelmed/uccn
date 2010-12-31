require 'spec_helper'

describe MembersHelper do
  it 'should return a valid phone number' do
    helper.string_to_phone_number("333.333.3333").should == "(333) 333-3333"
    helper.string_to_phone_number("3333333333").should == "(333) 333-3333"
    helper.string_to_phone_number("(333)333-3333").should == "(333) 333-3333"
    helper.string_to_phone_number("(333) 333-3333").should == "(333) 333-3333"    
  end
  
  it 'should return blank if nil is passed' do
    helper.strip_numbers_only(nil).should == nil
  end
  
  it 'should return blank if blank is passed' do
    helper.strip_numbers_only("").should == nil
  end
  
  it 'should return blank if not a valid phone number' do
    helper.strip_numbers_only("NOT VALID").should == nil
  end
  
  it 'should return numbers stripped' do
    helper.strip_numbers_only("3333333").should == "3333333"
    helper.strip_numbers_only("333.333.3333").should == "3333333333"
    helper.strip_numbers_only("(333)333-3333").should == "3333333333"
    helper.strip_numbers_only("3333333333").should == "3333333333"
    helper.strip_numbers_only("(333) 333-3333").should == "3333333333"
  end
  
  it 'should return blank if the number is not a valid phone number' do
     helper.string_to_phone_number("3333").should == ""
     helper.string_to_phone_number("3333333").should == ""
  end
  
  it 'is fucked up' do
    number_to_phone("3333").should == "3333"
  end

end
