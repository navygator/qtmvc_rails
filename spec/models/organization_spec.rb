require 'spec_helper'

describe Organization do
  let(:valid_attr) { { :name => 'Example Organization', :inn => '3445671234' } }

  it "should create the new instance give valid attributes" do
    Organization.create!(valid_attr)
  end

  describe "inn" do
    it "should require inn" do
      no_inn = Organization.new(valid_attr.merge(:inn => ""))
      no_inn.should_not be_valid
    end

    it "should reject shorter than 10 numbers" do
      short_inn = Organization.new(valid_attr.merge(:inn => "123456789"))
      short_inn.should_not be_valid
    end

    it "should reject larger than 10 numbers length" do
      big_inn = Organization.new(valid_attr.merge(:inn => "12345678901"))
      big_inn.should_not be_valid
    end

    it "should contains only digits" do
      invalid_inn = Organization.new(valid_attr.merge(:inn => "123456789a"))
      invalid_inn.should_not be_valid
    end
  end

  describe "employees relations" do
    before(:each) do
      @organization = Organization.create!(valid_attr)
    end

    it "should have employees" do
      @organization.should respond_to(:employees)
    end
  end
end
