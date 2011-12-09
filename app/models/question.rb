class Question < ActiveRecord::Base
  belongs_to :user
  has_many :replies, :dependent => :destroy
  
  has_many :tags
 
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  
  def self.feed(last)
    self.where("created_at < ? ", last).order('created_at desc').limit(10)
  end
  
end
