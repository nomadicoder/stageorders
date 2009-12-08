class Stage < ActiveRecord::Base
  has_many :runners
  def self.find_all_stages
    find(:all, :order => "number")
  end
end
