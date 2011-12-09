require "tags_helper"

class Tag < ActiveRecord::Base
  include TagsHelper
  validates :name, :presence => true
  validates :question_id, :presence => true
  
  
  
  belongs_to :question
  
end
