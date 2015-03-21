require 'rails_helper'

RSpec.describe "stages/new", :type => :view do
  before(:each) do
    assign(:stage, Stage.new(
      :number => 1,
      :landmark => "MyString",
      :miles => 1.5,
      :difficulty => 1
    ))
  end

  it "renders new stage form" do
    render

    assert_select "form[action=?][method=?]", stages_path, "post" do

      assert_select "input#stage_number[name=?]", "stage[number]"

      assert_select "input#stage_landmark[name=?]", "stage[landmark]"

      assert_select "input#stage_miles[name=?]", "stage[miles]"

      assert_select "input#stage_difficulty[name=?]", "stage[difficulty]"
    end
  end
end
