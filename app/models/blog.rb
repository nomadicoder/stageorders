class Blog < ActiveRecord::Base
  belongs_to :team

  def self.find_blog_for_team(team)
    find(:first, :joins => :stage, :conditions => "team_id = #{team.id}") unless team.nil?
  end
end
