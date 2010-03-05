class RunnerStatusCode < ActiveRecord::Base
  has_many :runner
  has_many :stage_status
  has_many :stage_status_code
end
