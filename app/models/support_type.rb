class SupportType < ActiveRecord::Base
  has_many :support_unit
  belongs_to :stage_status
end
