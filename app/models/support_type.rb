class SupportType < ActiveRecord::Base
  attr_accessible :description, :short_code
  has_many :support_unit
  belongs_to :stage_status
end
