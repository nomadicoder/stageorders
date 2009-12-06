class AddRunnerCodes < ActiveRecord::Migration
  def self.up
    RunnerStatusCode.delete_all 
    RunnerStatusCode.create(
        :sequence => 0.0,
        :short_code => 'UNK',
        :description => %{Runner status is unknown}
    )
    RunnerStatusCode.create(
        :sequence => 1.0,
        :short_code => 'ENR',
        :description => %{Runner is enroute to stage}
    )
    RunnerStatusCode.create(
        :sequence => 2.0,
        :short_code => 'ARR',
        :description => %{Runner has arrived at the stage}
    )
    RunnerStatusCode.create(
        :sequence => 3.0,
        :short_code => 'CHK',
        :description => %{Runner has checked in at the stage}
    )
    RunnerStatusCode.create(
        :sequence => 4.0,
        :short_code => 'MET',
        :description => %{Runner has made contact with the catcher}
    )
    RunnerStatusCode.create(
        :sequence => 5.0,
        :short_code => 'RDY',
        :description => %{Runner is in the chute awaiting the exchange}
    )
    RunnerStatusCode.create(
        :sequence => 6.0,
        :short_code => 'RUN',
        :description => %{Runner is on the course running the stage}
    )
    RunnerStatusCode.create(
        :sequence => 7.0,
        :short_code => 'ONE',
        :description => %{Runner is on the course running the stage}
    )
    RunnerStatusCode.create(
        :sequence => 8.0,
        :short_code => 'FIN',
        :description => %{Runner has completed the stage}
    )
    RunnerStatusCode.create(
        :sequence => 9.0,
        :short_code => 'END',
        :description => %{Runner has cleared the stage}
    )
  end

  def self.down
    RunnerStatusCode.delete_all
  end
end
