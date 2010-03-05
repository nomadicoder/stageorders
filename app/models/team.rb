class Team < ActiveRecord::Base
  has_many :runners
  has_many :stage_status
end
