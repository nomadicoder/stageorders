class SupportStatusCode < ActiveRecord::Base
  attr_accessible :description, :sequence, :short_code
  has_many :support_unit
  has_many :stage_status
end
