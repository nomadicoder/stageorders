class AddTestRunnerData < ActiveRecord::Migration
  def self.up
    Runner.delete_all 
    Runner.create(
        :stage_id => 1,
        :name => %{Adam},
        :estimated_pace => '00:08:42',
        :completed => false
    )
    Runner.create(
        :stage_id => 2,
        :name => %{Boy},
        :estimated_pace => '00:07:48',
        :completed => false
    )
    Runner.create(
        :stage_id => 3,
        :name => %{Charlie},
        :estimated_pace => '00:08:49',
        :completed => false
    )
    Runner.create(
        :stage_id => 4,
        :name => %{David},
        :estimated_pace => '00:08:20',
        :completed => false
    )
    Runner.create(
        :stage_id => 5,
        :name => %{Edward},
        :estimated_pace => '00:08:22',
        :completed => false
    )
    Runner.create(
        :stage_id => 6,
        :name => %{Frank},
        :estimated_pace => '00:08:52',
        :completed => false
    )
    Runner.create(
        :stage_id => 7,
        :name => %{George},
        :estimated_pace => '00:07:48',
        :completed => false
    )
    Runner.create(
        :stage_id => 8,
        :name => %{Henry},
        :estimated_pace => '00:08:42',
        :completed => false
    )
    Runner.create(
        :stage_id => 9,
        :name => %{Ida},
        :estimated_pace => '00:08:42',
        :completed => false
    )
    Runner.create(
        :stage_id => 10,
        :name => %{John},
        :estimated_pace => '00:08:42',
        :completed => false
    )
    Runner.create(
        :stage_id => 11,
        :name => %{King},
        :estimated_pace => '00:08:42',
        :completed => false
    )
    Runner.create(
        :stage_id => 12,
        :name => %{Lincoln},
        :estimated_pace => '00:08:42',
        :completed => false
    )
    Runner.create(
        :stage_id => 13,
        :name => %{Mary},
        :estimated_pace => '00:08:42',
        :completed => false
    )
    Runner.create(
        :stage_id => 14,
        :name => %{Nora},
        :estimated_pace => '00:08:42',
        :completed => false
    )
    Runner.create(
        :stage_id => 15,
        :name => %{Ocean},
        :estimated_pace => '00:08:42',
        :completed => false
    )
    Runner.create(
        :stage_id => 16,
        :name => %{Paul},
        :estimated_pace => '00:08:42',
        :completed => false
    )
    Runner.create(
        :stage_id => 17,
        :name => %{Queen},
        :estimated_pace => '00:08:42',
        :completed => false
    )
    Runner.create(
        :stage_id => 18,
        :name => %{Sam},
        :estimated_pace => '00:08:42',
        :completed => false
    )
    Runner.create(
        :stage_id => 19,
        :name => %{Tom},
        :estimated_pace => '00:08:42',
        :completed => false
    )
    Runner.create(
        :stage_id => 20,
        :name => %{Union},
        :estimated_pace => '00:08:42',
        :completed => false
    )
  end

  def self.down
        Runner.delete_all
  end
end
