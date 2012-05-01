class StageStatusCode < ActiveRecord::Base
  attr_accessible :description, :runner_status_code_id, :sequence, :short_code, :support_status_code_id
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
    def self.get_state(runner_status_code, support_status_code)
      # check to see if stage state for runner state is a terminal state
      state = find(:first,
                   :conditions => {:runner_status_code_id  => RunnerStatusCode.find_by_short_code(runner_status_code).id,
                                   :support_status_code_id => nil})
      # check to see if stage state for support unit state is a terminal state
      if state.nil?
        state = find(:first,
                     :conditions => {:support_status_code_id => SupportStatusCode.find_by_short_code(support_status_code).id,
                                     :runner_status_code_id  => nil})
        # Otherwise, stage state has both runner and support state
        if state.nil?
          state = find(:first, :joins => [:runner_status_code, :support_status_code],
             :conditions => "runner_status_codes.short_code = '#{runner_status_code}' AND support_status_codes.short_code = '#{support_status_code}'")
        end
      end
    end
end
