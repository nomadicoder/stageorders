class StageStatusCode < ActiveRecord::Base
    has_many :stage_status
    belongs_to :runner_status_code
    belongs_to :support_status_code
    
    def runner_status
      runner_status_code.short_code if runner_status_code
    end

    def runner_status=(runner_status)
      self.runner_status_code = RunnerStatusCode.find_by_short_code(runner_status) unless runner_status.blank?
    end

    def support_status
      support_status_code.short_code if support_status_code
    end

    def support_status=(short_code)
      self.support_short_code = SupportStatusCode.find_by_short_code(short_code) unless short_code.blank?
    end
    
    # get the stage for the given runner and support status codes
    def self.get_state (runner_status_code, support_status_code)
      state = find(:first, :joins => [:runner_status_code, :support_status_code],
           :conditions => "runner_status_codes.short_code = '#{runner_status_code}' AND support_status_codes.short_code = '#{support_status_code}'")
    end
end
