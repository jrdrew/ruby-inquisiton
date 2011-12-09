require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the RepliesHelper. For example:
#
# describe RepliesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end

class QuestionsHelperClass
end


describe QuestionsHelper do
  
  before(:each) do
    @question_helper_class = QuestionsHelperClass.new
    @question_helper_class.extend(QuestionsHelper)
  end  
  
  describe "tag_splitter" do
    it "with empty string" do
      @question_helper_class.tag_splitter('').should eq([])
    end
    
    it "with no comma in string" do
       @question_helper_class.tag_splitter('Scala').should eq(["Scala"])
    end
    
    it "with commas in string" do
       @question_helper_class.tag_splitter('Scala,Java,Ruby').should eq(["Scala", "Java", "Ruby"])
    end
  end
end
