class Stage < ActiveRecord::Base
  has_many :runners
  has_one :support_unit
  
  def self.find_all_stages
    find(:all, :order => "number")
  end
end
