class SupportUnit < ActiveRecord::Base
  belongs_to :team
  belongs_to :stage
  belongs_to :support_type
  
  validates_presence_of :support_type
end
