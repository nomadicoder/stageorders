class Stage < ActiveRecord::Base
  has_many :runner
  def self.find_all_stages
    find(:all, :order => "number")
  end
end
