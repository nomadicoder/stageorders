class AddSupportType < ActiveRecord::Migration
  def self.up
    SupportType.delete_all
    SupportType.create(
        :short_code => 'NONE',
        :description => %{None}
    )
    SupportType.create(
        :short_code => 'FOLLOW',
        :description => %{Follow Van -- Follows runner on course}
    )
    SupportType.create(
        :short_code => 'SHUTTLE',
        :description => %{Shuttle Van -- Transports runners and personnel between stages}
    )
    SupportType.create(
        :short_code => 'ROVER',
        :description => %{Rover vehicle -- Performs utility functions}
    )
    SupportType.create(
        :short_code => 'CP',
        :description => %{Command Post -- Center of support operations}
    )
    SupportType.create(
        :short_code => 'MOUNTAINTOP',
        :description => %{Mountain top radio relay}
    )
  end

  def self.down
    SupportType.delete_all
  end
end
