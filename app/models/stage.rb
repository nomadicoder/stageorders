class Stage < ActiveRecord::Base
  attr_accessible :difficulty, :landmark, :miles, :number
  has_many :runners
  has_one :support_unit
  has_many :stage_status
    
  def self.find_all_stages
    find(:all, :order => "number")
  end
end
