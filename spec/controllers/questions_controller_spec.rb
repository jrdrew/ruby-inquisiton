require 'spec_helper'

describe QuestionsController do
  
  before(:each) do
  end

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      response.code.should eq("200")
      response.should render_template("index")
    end
    
    it "has a list of questions" do
      get :index
#      response.should have_selector("h1", :content => "Widgets")
    end
  end
end
