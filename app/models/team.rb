class Team < ActiveRecord::Base
  has_many :runners
  has_many :support_units
  has_many :stage_status
end
