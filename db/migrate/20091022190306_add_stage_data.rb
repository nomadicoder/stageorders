class AddStageData < ActiveRecord::Migration
  def self.up
    Stage.delete_all 
    Stage.create(
        :number => 1,
        :landmark => %{Start},
        :miles => 5.4,
        :difficulty => 13
    )
    Stage.create(
        :number => 2,
        :landmark => %{Dumont},
        :miles => 8.2,
        :difficulty => 1
    )
    Stage.create(
        :number => 3,
        :landmark => %{Ibex Up},
        :miles => 5.1,
        :difficulty => 6
    )
    Stage.create(
        :number => 4,
        :landmark => %{Ibex Down},
        :miles => 6.0,
        :difficulty => 20
    )
    Stage.create(
        :number => 5,
        :landmark => %{Tecopa},
        :miles => 6.1,
        :difficulty => 12
    )
    Stage.create(
        :number => 6,
        :landmark => %{Shoshone},
        :miles => 6.2,
        :difficulty => 5
    )
    Stage.create(
        :number => 7,
        :landmark => %{Chicago Valley},
        :miles => 7.3,
        :difficulty => 2
    )
    Stage.create(
        :number => 8,
        :landmark => %{},
        :miles => 6.8,
        :difficulty => 9
    )
    Stage.create(
        :number => 9,
        :landmark => %{State Line},
        :miles => 5.8,
        :difficulty => 16
    )
    Stage.create(
        :number => 10,
        :landmark => %{Pahrump},
        :miles => 5.3,
        :difficulty => 14
    )
    Stage.create(
        :number => 11,
        :landmark => %{},
        :miles => 4.7,
        :difficulty => 19
    )
    Stage.create(
        :number => 12,
        :landmark => %{},
        :miles => 7.0,
        :difficulty => 3
    )
    Stage.create(
        :number => 13,
        :landmark => %{Old Spanish Trail},
        :miles => 5.4,
        :difficulty => 7
    )
    Stage.create(
        :number => 14,
        :landmark => %{},
        :miles => 5.2,
        :difficulty => 8
    )
    Stage.create(
        :number => 15,
        :landmark => %{},
        :miles => 5.5,
        :difficulty => 4
    )
    Stage.create(
        :number => 16,
        :landmark => %{Mountain Springs},
        :miles => 6.8,
        :difficulty => 11
    )
    Stage.create(
        :number => 17,
        :landmark => %{},
        :miles => 7.3,
        :difficulty => 10
    )
    Stage.create(
        :number => 18,
        :landmark => %{Ft Apache},
        :miles => 5.7,
        :difficulty => 15
    )
    Stage.create(
        :number => 19,
        :landmark => %{Desert Inn},
        :miles => 5.8,
        :difficulty => 17
    )
    Stage.create(
        :number => 20,
        :landmark => %{Finish},
        :miles => 4.4,
        :difficulty => 18
    )  end

  def self.down
    Stage.delete_all
  end
end
