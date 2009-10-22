class Runner < ActiveRecord::Base
  belongs_to :stage
  belongs_to :team
end
