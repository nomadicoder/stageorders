class Runner < ActiveRecord::Base
  belongs_to :stage
  belongs_to :team
  def self.find_all_runners
    find(:all, :order => "stage_id")
  end
end
