class SupportStatusCode < ActiveRecord::Base
  has_many :support_unit
  has_many :stage_status
end
