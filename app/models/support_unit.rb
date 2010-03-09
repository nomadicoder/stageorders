class SupportUnit < ActiveRecord::Base
  belongs_to :current_stage, :class_name => "Stage"
  belongs_to :team
  belongs_to :support_type
  belongs_to :support_status_code
  has_many :stage_status
  
  validates_presence_of :support_type
  
  def short_code()
    support_type.short_code if support_type
  end
  
  def short_code=(short_code)
    self.support_type = SupportType.find_by_short_code(short_code) unless short_code.blank?
  end
  
  def support_status()
    support_status_code.short_code if support_status_code
  end
  
  def support_status=(short_code)
    self.support_status_code = SupportStatusCode.find_by_short_code(short_code) unless short_code.blank?
  end
end
