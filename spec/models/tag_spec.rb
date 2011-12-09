require 'spec_helper'

describe Tag do
  
  before(:each) do
    @tag = Tag.new
    
  end
  describe "create" do
    it "try and create a Tag without text" do 
      @tag.question_id = 123
      expect {@tag.save!}.to raise_error(ActiveRecord::RecordInvalid)
      
      @tag.save.should be(false)
    end
    
    it "try and create a Tag without a question" do
      @tag.name = "ruby"
      expect {@tag.save!}.to raise_error(ActiveRecord::RecordInvalid)
      
      @tag.save.should be(false)
    end
    
    
    it "try and create a Tag with text" do
      @tag.name = "ruby"
      @tag.question_id = 123
      @tag.save.should be(true)
    end
  end
  
  describe "create new tags" do
    it "can create using splitter" do
      @results = Tag.new.tag_splitter("abc,def").should eq(["abc", "def"])
    end
    
    it "can create using splitter" do
      @question = Question.new
      @question.id = Time.now
      
      Tag.new.tag_splitter("abc").each {|tag_name|
          @tag_to_save = Tag.new(:question_id => @question.id, :name => tag_name)
          @tag_to_save.save
      }
      
      @tag2 = Tag.find_by_name_and_question_id("abc", @question.id)

      @tag2.name.should eq("abc")
    end
  end
  
  describe "tag splitter" do
    it " can be called from Tag" do
      @tag.tag_splitter("abc,def").should eq(["abc", "def"])
     
    end
  end
end
