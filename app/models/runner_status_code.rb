class RunnerStatusCode < ActiveRecord::Base
  attr_accessible :description, :sequence, :short_code
  has_many :runner
  has_many :stage_status
  has_many :stage_status_code
end
