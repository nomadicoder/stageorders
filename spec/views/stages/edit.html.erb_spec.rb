require 'rails_helper'

RSpec.describe "stages/edit", :type => :view do
  before(:each) do
    @stage = assign(:stage, Stage.create!(
      :number => 1,
      :landmark => "MyString",
      :miles => 1.5,
      :difficulty => 1
    ))
  end

  it "renders the edit stage form" do
    render

    assert_select "form[action=?][method=?]", stage_path(@stage), "post" do

      assert_select "input#stage_number[name=?]", "stage[number]"

      assert_select "input#stage_landmark[name=?]", "stage[landmark]"

      assert_select "input#stage_miles[name=?]", "stage[miles]"

      assert_select "input#stage_difficulty[name=?]", "stage[difficulty]"
    end
  end
end
