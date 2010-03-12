class Team < ActiveRecord::Base
  has_many :runners
  has_many :support_units
  has_many :stage_status

  def self.find_by_short_code (short_code)
    find(:first, :conditions => "short_name = '#{short_code}'")
  end

end
