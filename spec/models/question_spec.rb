require 'spec_helper'

describe Question do
  before(:each) do
  end
  
  describe "feed" do  
    it "with no questions should return an empty list" do
      
    end
    
    it "with one question return an array of 1" do
      @question = Question.create
      
      @questions = Question.feed(Time.now)
      (@questions.include?@question).should eq(true)
    end
    describe "10 questions" do
      before(:each) do
      end
      it ""
    end
  end
  
  describe "create" do
    it "should work if you give it an array of tags" do
      vals = ['Foo', 'Bar', 'Baz']
      
      question = Question.new
      tag = Tag.new :question_id => question.id
      
      tag_names = question.tags.select {|tag| tag.name}
  
#      tag_names.should eq(vals)
    end
  end
end