class Stage < ActiveRecord::Base
  has_many :runners
  has_one :support_unit
  has_many :stage_status
    
  def self.find_all_stages
    Stage.order(:number)
  end
end
