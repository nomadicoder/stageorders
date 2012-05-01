class Blog < ActiveRecord::Base
  attr_accessible :access_path, :access_url, :blog_number, :blog_url, :category, :host_url, :password, :results_post_number, :results_url, :team_id, :username
  belongs_to :team

  def self.find_blog_for_team(team)
    find(:first, :joins => :stage, :conditions => "team_id = #{team.id}") unless team.nil?
  end
end
