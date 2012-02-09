require 'spec_helper'

describe RelationshipsController do

  describe "GET 'new'" do
    it "returns http success" do
      get :new
      response.should be_success
    end

    it "should assign organization collection"
    it "should assign employee collection"
  end

  describe "POST 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "DELETE 'destroy'" do
    it "returns http success" do
      get :destroy
      response.should be_success
    end
  end

end
