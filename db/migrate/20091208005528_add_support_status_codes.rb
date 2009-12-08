class AddSupportStatusCodes < ActiveRecord::Migration
  def self.up
    SupportStatusCode.delete_all
    SupportStatusCode.create(
        :sequence => 0.0,
        :short_code => 'UNK',
        :description => %{Runner status is unknown}
    )
    SupportStatusCode.create(
        :sequence => 1.0,
        :short_code => 'ENR',
        :description => %{Shuttle is enroute to stage}
    )
    SupportStatusCode.create(
        :sequence => 2.0,
        :short_code => 'ARR',
        :description => %{Unit has arrived at assignment (e.g. exchange point)}
    )
    SupportStatusCode.create(
        :sequence => 3.0,
        :short_code => 'MET',
        :description => %{Catcher has made contact with the runner}
    )
    SupportStatusCode.create(
        :sequence => 0.1,
        :short_code => 'STG',
        :description => %{Shuttle is at staging}
    )
    SupportStatusCode.create(
        :sequence => 0.2,
        :short_code => 'OUT',
        :description => %{Shuttle is out of service (on break, refueling, etc)}
    )
  end

  def self.down
    SupportStatusCode.delete_all
  end
end
